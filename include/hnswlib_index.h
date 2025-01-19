#pragma once

#include <cstdint>
#include <utility>
#include <vector>
#include "hnswlib/hnswalg.h"
#include "hnswlib/hnswlib.h"
#include "_index_factory.h"

class HNSWLibIndex {
    public:

    // 构造函数
    HNSWLibIndex(int dim, int num_data, IndexFactory::MetricType metric, int M = 16, int ef_construction = 200);

    // 插入向量
    void insert_vectors(const std::vector<float>& data, uint64_t label);

    // 查询向量
    std::pair<std::vector<long>, std::vector<float>> search_vectors(const std::vector<float>& query, int k, int ef_search = 50);

    private:
    int dim;
    hnswlib::SpaceInterface<float>* space;
    hnswlib::HierarchicalNSW<float>* index;
};