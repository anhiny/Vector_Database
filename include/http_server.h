#ifndef VECOTR_DB_HTTP_SERVER_H
#define VECOTR_DB_HTTP_SERVER_H

#include "faiss_index.h"
#include "Index.h"
#include "httplib.h"
#include "_index_factory.h"
#include "rapidjson/document.h"
#include "vector_database.h"
#include <string>

class HttpServer{
public:
    enum class CheckType {
        SEARCH,
        INSERT,
        UPSERT
    };

    HttpServer(const std::string& host, int port, VectorDatabase* vector_database);

    void start();

private:
    void searchHandler(const httplib::Request& req, httplib::Response& res);
    void insertHandler(const httplib::Request& req, httplib::Response& res);
    void upsertHandler(const httplib::Request& req, httplib::Response& res);
    void queryHandler(const httplib::Request& req, httplib::Response& res);
    void setJsonResponse(const rapidjson::Document& json_response, httplib::Response& res);
    void setErrorJsonResponse(httplib::Response& res, int error_code, const std::string& errorMsg);
    bool isRequestValid(const rapidjson::Document& json_request, CheckType check_type);
    IndexFactory::IndexType getIndexTypeFromRequest(const rapidjson::Document& json_request);

    httplib::Server server;
    std::string host;
    int port;
    VectorDatabase* vector_database_;
};





































#endif //VECOTR_DB_HTTP_SERVER_H
