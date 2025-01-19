#include "vector_database.h"
#include "_index_factory.h"
#include "faiss_index.h"
#include "hnswlib_index.h"
#include "rapidjson/rapidjson.h"
#include <cstdint>
#include <stdexcept>
#include <vector>
#include <rapidjson/document.h>

VectorDatabase::VectorDatabase(const std::string& db_path) : scalar_storage_(db_path) {}

void VectorDatabase::upsert(uint64_t id, const rapidjson::Document& data, IndexFactory::IndexType index_type){
    // 检查标量存储中是否存在给定的ID向量
    rapidjson::Document existingData;
    try {
    existingData = scalar_storage_.get_scalar(id);
    } catch (const std::runtime_error& e) {
        // 向量不存在， 继续执行插入操作
    }

    // 如果存在现有向量，则从索引中删除它
    if (existingData.IsObject()) {
        std::vector<float> existingVector(existingData["vectors"].Size());
        for (rapidjson::SizeType i = 0; i < existingData["vectors"].Size(); ++i) {
            existingVector[i] = existingData["vectors"].GetFloat();
        }

        void* index = getGlobalIndexFactory()->getIndex(index_type);
        switch (index_type) {
            case IndexFactory::IndexType::FLAT: {
                FaissIndex* faiss_index = static_cast<FaissIndex*>(index);
                faiss_index->remove_vector({static_cast<long>(id)});
                break;
            }
            case IndexFactory::IndexType::HNSW: {
                HNSWLibIndex* hnsw_index = static_cast<HNSWLibIndex*>(index);
                // 删除向量操作
                break;
            }
            default:
                break;
        }
    }

    // 将新向量插入索引
    std::vector<float> newVector(data["vectors"].Size());
    for (rapidjson::SizeType i = 0; i < data["vectors"].Size(); ++i) {
        newVector[i] = data["vectors"].GetFloat();
    }

    void* index = getGlobalIndexFactory()->getIndex(index_type);
    switch (index_type) {
        case IndexFactory::IndexType::FLAT: {
            FaissIndex* faiss_index = static_cast<FaissIndex*>(index);
            faiss_index->insert_vector(newVector, id);
            break;
        }
        case IndexFactory::IndexType::HNSW: {
            HNSWLibIndex* hnsw_index = static_cast<HNSWLibIndex*>(index);
            hnsw_index->insert_vectors(newVector, id);
            break;
        }
        default:
            break;
    }

    // 更新标量存储中的向量
    scalar_storage_.insert_scalar(id, data);
}

rapidjson::Document VectorDatabase::query(uint64_t id) {
    return scalar_storage_.get_scalar(id);
}
