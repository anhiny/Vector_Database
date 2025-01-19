#ifndef VECTOR_DB_FAISS_INDEX_H
#define VECTOR_DB_FAISS_INDEX_H

#include <Index.h>
#include <vector>



class FaissIndex {
public:
    FaissIndex(faiss::Index* index);
    void insert_vector(const std::vector<float>& data, uint64_t label);
    void remove_vector(const std::vector<long>& ids);
    std::pair<std::vector<long>, std::vector<float>>search_vector(const std::vector<float>& query, int k);

private:
    faiss::Index* index;
};
























#endif //VECTOR_DB_FAISS_INDEX_H
