#ifndef VECOTR_DB_INDEX_FACTORY_H
#define VECOTR_DB_INDEX_FACTORY_H

#include "faiss_index.h"
#include <map>

class IndexFactory {
public:
    enum class IndexType {
        FLAT,
        HNSW,
        UNKNOWN = -1
    };

    enum  class MetricType {
        L2,
        IP
    };

    void init(IndexType type, int dim, int num_data = 0,MetricType metric = MetricType::L2);

    void* getIndex(IndexType type) const;

private:
    std::map<IndexType, void*>index_map;
};

IndexFactory* getGlobalIndexFactory();























#endif //VECOTR_DB_INDEX_FACTORY_H
