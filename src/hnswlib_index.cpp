#include "hnswlib_index.h"
#include "_index_factory.h"
#include "hnswlib/hnswalg.h"
#include "hnswlib/space_l2.h"
#include <cstdint>
#include <stdexcept>
#include <vector>

HNSWLibIndex::HNSWLibIndex(int dim, int num_data, IndexFactory::MetricType metric, int M, int ef_construction) : dim(dim) {
    bool normalize = false;
    if (metric == IndexFactory::MetricType::L2) {
        space = new hnswlib::L2Space(dim);
    } else {
        throw std::runtime_error("Invalid metric type.");
    }
    index = new hnswlib::HierarchicalNSW<float>(space, num_data, M, ef_construction);
};

void HNSWLibIndex::insert_vectors(const std::vector<float>& data, uint64_t label) {
    index->addPoint(data.data(), label);
}

  std::pair<std::vector<long>, std::vector<float>> HNSWLibIndex::search_vectors(const std::vector<float>& query, int k, int ef_search) {
    index->setEf(ef_search);
    auto result = index->searchKnn(query.data(), k);

    std::vector<long> indices(k);
    std::vector<float> distances(k);
    for (int j = 0; j < k; j++) {
        auto item = result.top();
        indices[j] = item.second;
        distances[j] = item.first;
        result.pop();
    }

    return {indices, distances};
  }

