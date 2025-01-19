#include <cstdint>
#include <rocksdb/db.h>
#include <string>
#include <vector>
#include <rapidjson/document.h>

class ScalarStorage {
public:
    // 构造函数
    ScalarStorage(const std::string& db_path);

    // 析构函数
    ~ScalarStorage();

    // 向量插入函数
    void insert_scalar(uint64_t id, const rapidjson::Document& data);

    // 根据ID查询向量函数
    rapidjson::Document get_scalar(uint64_t id);
private:
    // RocksDB实例
    rocksdb::DB* db_;
};