#include "faiss_index.h"
#include "Index.h"
#include "logger.h"
#include "constants.h" 
#include <faiss/IndexIDMap.h>
#include <faiss/impl/IDSelector.h>
#include <iostream>
#include <stdexcept>
#include <vector>
#include "vector_database.h"



FaissIndex::FaissIndex(faiss::Index* index) : index(index) {};

void FaissIndex::insert_vector(const std::vector<float>& data, uint64_t label) {
    long id = static_cast<long>(label);
    index->add_with_ids(1, data.data(), &id);
}


std::pair<std::vector<long>, std::vector<float>> FaissIndex::search_vector(const std::vector<float> &query, int k) {
    int dim = index->d;     // 向量的维度
    int num_queries = query.size() / dim;      // 向量个数
    std::vector<long> indices(num_queries * k);     // 保存查询到的向量的集合
    std::vector<float> distance(num_queries * k);       // 保存查询到的距离集合

    index->search(num_queries, query.data(), k, distance.data(), indices.data());

    return {indices, distance};

}

void FaissIndex::remove_vector(const std::vector<long>& ids) {
    faiss::IndexIDMap * id_map = dynamic_cast<faiss::IndexIDMap*>(index);
    if (id_map) {
        // 初始化IDSelectorBatch对象
        faiss::IDSelectorBatch selector(ids.size(), ids.data());
        id_map->remove_ids(selector);
    } else {
        throw std::runtime_error("Underlying Faiss index is not an IndexIDMap");
    }
}