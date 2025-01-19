#pragma once
#include <cstdint>

#include "_index_factory.h"
#include "scalar_storage.h"
#include <string>
#include <vector>
#include <rapidjson/document.h>

class VectorDatabase {
public:
    VectorDatabase(const std::string& db_path);

    // 插入或更新向量
    void upsert(uint64_t id, const rapidjson::Document& data, IndexFactory::IndexType index_type);
    // 查询向量
    rapidjson::Document query(uint64_t id);

private:
    ScalarStorage scalar_storage_;
};