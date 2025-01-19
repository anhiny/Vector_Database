#include "scalar_storage.h"
#include "logger.h"
#include "rocksdb/options.h"
#include "rocksdb/status.h"
#include <cstdint>
#include <rocksdb/db.h>
#include <rapidjson/document.h>
#include <rapidjson/stringbuffer.h>
#include <rapidjson/writer.h>
#include <stdexcept>
#include <string>
#include <vector>


ScalarStorage::ScalarStorage(const std::string& db_path) {
    rocksdb::Options options;
    options.create_if_missing = true;
    rocksdb::Status status = rocksdb::DB::Open(options, db_path, &db_);
    if (!status.ok()) {
        throw std::runtime_error("Failed to open RocksDB: " + status.ToString());
    }
}

ScalarStorage::~ScalarStorage() {
    delete db_;
}

void ScalarStorage::insert_scalar(uint64_t id, const rapidjson::Document& data) {
    rapidjson::StringBuffer buffer;
    rapidjson::Writer<rapidjson::StringBuffer> writer(buffer);
    data.Accept(writer);
    std::string value = buffer.GetString();

    rocksdb::Status status = db_->Put(rocksdb::WriteOptions(), std::to_string(id), value);
    if (!status.ok()) {
        GlobalLogger->error("Failed to insert scalar: {}", status.ToString());
    }
}

rapidjson::Document ScalarStorage::get_scalar(uint64_t id) {
    std::string value;
    rocksdb::Status status = db_->Get(rocksdb::ReadOptions(), std::to_string(id), &value);
    if (!status.ok()) {
        return rapidjson::Document();
    }

    rapidjson::Document data;
    data.Parse(value.c_str());

    // 打印从ScalarStorage获取的数据和rocksdb::Status status
    rapidjson::StringBuffer buffer;
    rapidjson::Writer<rapidjson::StringBuffer>write(buffer);
    data.Accept(write);
    GlobalLogger->debug("Data retrieved from ScalarStorage: {}, RocksDB status: {}", buffer.GetString(), status.ToString());
    return data;
}