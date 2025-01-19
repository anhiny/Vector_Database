#include "http_server.h"
#include "_index_factory.h"
#include "faiss_index.h"
#include "hnswlib_index.h"
#include "httplib.h"
#include <cstddef>
#include <cstdint>
#include <iostream>
#include <rapidjson/document.h>
#include <rapidjson/writer.h>
#include <rapidjson/stringbuffer.h>
#include <utility>
#include <vector>
#include "logger.h"
#include "constants.h"
#include "rapidjson/rapidjson.h"
#include "vector_database.h"

HttpServer::HttpServer(const std::string& host, int port, VectorDatabase* vector_database) : host(host), port(port) , vector_database_(vector_database){
    server.Post("/search", [this](const httplib::Request& req, httplib::Response& res) {
        GlobalLogger->debug("route of search");
        searchHandler(req, res);
    });
    server.Post("/insert", [this](const httplib::Request& req, httplib::Response& res) {
        GlobalLogger->debug("route of insert");
        insertHandler(req, res);
    });
    server.Post("/upsert", [this](const httplib::Request& req, httplib::Response& res) {
        GlobalLogger->debug("route of upsert");
        upsertHandler(req, res);
    });
    server.Post("/query", [this](const httplib::Request& req, httplib::Response& res) {
        GlobalLogger->debug("route of query");
        queryHandler(req, res);
    });
}

void HttpServer::start() {
    server.listen(host.c_str(), port);
}

bool HttpServer::isRequestValid(const rapidjson::Document &json_request, HttpServer::CheckType check_type) {
    switch (check_type) {
        case CheckType::SEARCH:
            return json_request.HasMember(REQUEST_VECTORS) &&
                   json_request.HasMember(REQUEST_K) &&
                    (!json_request.HasMember(REQUEST_INDEX_TYPE) || json_request[REQUEST_INDEX_TYPE].IsString());
        case CheckType::INSERT:
            return json_request.HasMember(REQUEST_VECTORS) &&
                   json_request.HasMember(REQUEST_ID) &&
                   (!json_request.HasMember(REQUEST_INDEX_TYPE) || json_request[REQUEST_INDEX_TYPE].IsString());
        case CheckType::UPSERT: // 添加UPSERT逻辑
            return json_request.HasMember(REQUEST_VECTORS) &&
                   json_request.HasMember(REQUEST_ID) &&
                   (!json_request.HasMember(REQUEST_INDEX_TYPE) || json_request[REQUEST_INDEX_TYPE].IsString());
        default:
            return false;
    }
}


IndexFactory::IndexType HttpServer::getIndexTypeFromRequest(const rapidjson::Document &json_request) {
    // 获取请求参数中的索引类型
    if (json_request.HasMember(REQUEST_INDEX_TYPE)) {
        std::string index_type_str = json_request[REQUEST_INDEX_TYPE].GetString();
        if (index_type_str == "FLAT") {
            return IndexFactory::IndexType::FLAT;
        } else if (index_type_str == "HNSW") {
            return IndexFactory::IndexType::HNSW;
        }
    }
    return IndexFactory::IndexType::UNKNOWN;
}

void HttpServer::searchHandler(const httplib::Request &req, httplib::Response &res) {
    GlobalLogger->debug("Received search request");

    // 解析JSON请求
    rapidjson::Document json_request;
    json_request.Parse(req.body.c_str());

    // 打印用户输入参数
    GlobalLogger->info("Search request parameters: {}", req.body);

    // 检查JSON是否为有效对象
    if (!json_request.IsObject()) {
        GlobalLogger->error("Invalid JSON request");
        res.status = 400;
        setErrorJsonResponse(res, RESPONSE_RETCODE_ERROR, "Invalid JSON request");
        return;
    }

    // 检查请求的合法性
    if (!isRequestValid(json_request, CheckType::SEARCH)) {
        GlobalLogger->error("Missing vector or k parameter in the request");
        res.status = 400;
        setErrorJsonResponse(res, RESPONSE_RETCODE_ERROR, "Missing vectors or k parameter in the request");
        return;
    }

    // 获取请求参数
    std::vector<float> query;
    for (const auto& q : json_request[REQUEST_VECTORS].GetArray()) {
        query.push_back(q.GetFloat());
    }
    int k = json_request[REQUEST_K].GetInt();

    GlobalLogger->debug("Query parameters : k = {}", k);

    // 获取请求参数中的索引类型
    IndexFactory::IndexType indextype = getIndexTypeFromRequest(json_request);

    // 如果索引类型为UNKNOWN类型，返回400错误
    if (indextype == IndexFactory::IndexType::UNKNOWN) {
        GlobalLogger->error("Invalid indextype parameter in the request");
        res.status = 400;
        setErrorJsonResponse(res, RESPONSE_RETCODE_ERROR, "Invalid indextype parameter in the request");
        return;
    }

    // 使用全局IndexFactory获取索引对象
    void* index = getGlobalIndexFactory()->getIndex(indextype);

    // 根据索引类型初始化索引对象并调用search_vectors函数
    std::pair<std::vector<long>, std::vector<float>> result;
    switch (indextype) {
        case IndexFactory::IndexType::FLAT: {
            FaissIndex* faissIndex = static_cast<FaissIndex*>(index);
            result = faissIndex->search_vector(query, k);
            break;
        }
        case IndexFactory::IndexType::HNSW: {
            HNSWLibIndex* hnswIndex = static_cast<HNSWLibIndex*>(index);
            result = hnswIndex->search_vectors(query, k);
            break;
        }

        default:
            break;
    }

    // 将结果转换为JSON
    rapidjson::Document json_response;
    json_response.SetObject();
    rapidjson::Document::AllocatorType& allocator = json_response.GetAllocator();

    // 检查是否为有效的搜索结果
    bool valid_result = false;
    rapidjson::Value vector(rapidjson::kArrayType);
    rapidjson::Value distance(rapidjson::kArrayType);
    for (size_t i = 0; i < result.first.size(); ++i) {
        if (result.first[i] != -1) {
            valid_result = true;
            vector.PushBack(result.first[i], allocator);
            distance.PushBack(result.second[i], allocator);
        }
    }

    if (valid_result) {
        json_response.AddMember(RESPONSE_VECTORS, vector, allocator);
        json_response.AddMember(RESPONSE_DISTANCES, distance, allocator);
    }

    // 设置响应
    json_response.AddMember(RESPONSE_RETCODE, RESPONSE_RETCODE_SUCCESS, allocator);
    setJsonResponse(json_response, res);

}

void HttpServer::insertHandler(const httplib::Request& req, httplib::Response& res) {
    GlobalLogger->debug("Received insert request");

    // 解析JSON请求
    rapidjson::Document json_request;
    json_request.Parse(req.body.c_str());

    // 打印用户的输入参数
    GlobalLogger->info("Insert request parameters: {}", req.body);

    // 检查JSON文档是否为有效对象
    if (!json_request.IsObject()) {
        GlobalLogger->error("Invalid JSON request");
        res.status = 400;
        setErrorJsonResponse(res, RESPONSE_RETCODE_ERROR, "Invalid JSON request");
        return;
    }

    // 检查请求的合法性
    if (!isRequestValid(json_request, CheckType::INSERT)) { // 添加对isRequestValid的调用
        GlobalLogger->error("Missing vectors or id parameter in the request");
        res.status = 400;
        setErrorJsonResponse(res, RESPONSE_RETCODE_ERROR, "Missing vectors or k parameter in the request");
        return;
    }

    // 获取插入参数
    std::vector<float> data;
    for (const auto& d : json_request[REQUEST_VECTORS].GetArray()) {
        data.push_back(d.GetFloat());
    }
    uint64_t label = json_request[REQUEST_ID].GetUint64();

    GlobalLogger->debug("Insert parameters: label = {}", label);

    // 获取请求参数中的索引类型
    IndexFactory::IndexType indextype = getIndexTypeFromRequest(json_request);

    // 如果请求参数类型为UNKNOWN，返回400错误
    if (indextype == IndexFactory::IndexType::UNKNOWN) {
        GlobalLogger->error("Invalid indextype parameters in the request");
        res.status = 400;
        setErrorJsonResponse(res, RESPONSE_RETCODE_ERROR, "Invalid indextype parameters in the request");
        return;
    }

    // 使用全局IndexFactory获取索引对象
    void* index = getGlobalIndexFactory()->getIndex(indextype);

    // 根据索引类型初始化对象并调用insert_vectors函数
    switch (indextype) {
        case IndexFactory::IndexType::FLAT: {
            FaissIndex* faissIndex = static_cast<FaissIndex*>(index);
            faissIndex->insert_vector(data, label);
            break;
        }
        case IndexFactory::IndexType::HNSW: {
            HNSWLibIndex* hnswIndex = static_cast<HNSWLibIndex*>(index);
            hnswIndex->insert_vectors(data, label);
            break;
        }
        default:
            break;
    }

    // 设置响应
    rapidjson::Document json_response;
    json_response.SetObject();
    rapidjson::Document::AllocatorType& allocator = json_response.GetAllocator();

    // 添加retcode到响应
    json_response.AddMember(RESPONSE_RETCODE, RESPONSE_RETCODE_SUCCESS, allocator);

    setJsonResponse(json_response, res);
}


void HttpServer::upsertHandler(const httplib::Request& req, httplib::Response& res) {
    GlobalLogger->debug("Received upsert request");

    // 解析JSON请求
    rapidjson::Document json_request;
    json_request.Parse(req.body.c_str());

    // 检查JSON文档是否为有效对象
    if (!json_request.IsObject()) {
        GlobalLogger->error("Invalid JSON request");
        res.status = 400;
        setErrorJsonResponse(res, RESPONSE_RETCODE_ERROR, "Invalid JSON request");
        return;
    }

    // 检查请求的合法性
    if (!isRequestValid(json_request, CheckType::UPSERT)) {
        GlobalLogger->error("Missing vectors or id parameters in the request");
        res.status = 400;
        setErrorJsonResponse(res, RESPONSE_RETCODE_ERROR, "Missing vectors or id parameters in the request");
        return;
    }

    uint64_t label = json_request[REQUEST_ID].GetUint64();

    // 获取请求参数中的索引类型
    IndexFactory::IndexType index_type = getIndexTypeFromRequest(json_request);
    vector_database_->upsert(label, json_request, index_type);

    rapidjson::Document json_response;
    json_response.SetObject();
    rapidjson::Document::AllocatorType& response_allocator = json_response.GetAllocator();
    
    // 添加retCode到响应
    json_response.AddMember(RESPONSE_RETCODE, RESPONSE_RETCODE_SUCCESS, response_allocator);

    setJsonResponse(json_response, res);
}

void HttpServer::queryHandler(const httplib::Request& req, httplib::Response& res) {
    GlobalLogger->debug("Received query request");

    // 解析JSON请求
    rapidjson::Document json_request;
    json_request.Parse(req.body.c_str());

    // 检查JSON文档是否为有效对象
    if (!json_request.IsObject()) {
        GlobalLogger->error("Invalid JSON request");
        res.status = 400;
        setErrorJsonResponse(res, RESPONSE_RETCODE_ERROR, "Invalid JSON request");
        return;
    }

    // 从JSON请求中获取ID
    uint64_t id = json_request[REQUEST_ID].GetUint64(); // 使用宏REQUEST_ID

    // 查询JSON数据
    rapidjson::Document json_data = vector_database_->query(id);

    // 将结果转换为JSON
    rapidjson::Document json_response;
    json_response.SetObject();
    rapidjson::Document::AllocatorType& allocator = json_response.GetAllocator();

    // 如果查询到向量，则将json_data对象的内容合并到json_response中
    if (!json_data.IsNull()) {
        for (auto it = json_data.MemberBegin(); it != json_data.MemberEnd(); ++it) {
            json_response.AddMember(it->name, it->value, allocator);
        }
    }

    // 设置响应
    json_response.AddMember(RESPONSE_RETCODE, RESPONSE_RETCODE_SUCCESS, allocator);
    setJsonResponse(json_response, res);
  
}



void HttpServer::setJsonResponse(const rapidjson::Document& json_response, httplib::Response& res) {
    rapidjson::StringBuffer buffer;
    rapidjson::Writer<rapidjson::StringBuffer> write(buffer);
    json_response.Accept(write);
    res.set_content(buffer.GetString(), RESPONSE_CONTENT_TYPE_JSON);
}

void HttpServer::setErrorJsonResponse(httplib::Response& res, int error_code, const std::string& errorMsg) {
    rapidjson::Document json_response;
    json_response.SetObject();
    rapidjson::Document::AllocatorType& allocator = json_response.GetAllocator();
    json_response.AddMember(RESPONSE_RETCODE, error_code, allocator);
    json_response.AddMember(RESPONSE_ERROR_MSG, rapidjson::StringRef(errorMsg.c_str()), allocator);
    setJsonResponse(json_response, res);
}






















