cmake_minimum_required(VERSION 3.2)

project(vector_DB)


# 配置编译选项
set(CMAKE_CXX_FLAGS ${CMAKE_CXX_FLAGS} -g)

# 配置最终的可执行文件输出路径
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)

# 配置头文件搜索路径
include_directories(vdb
    /home/u/faiss/faiss
    /home/u/faiss/c_api
    /usr/local/include
    ${PROJECT_SOURCE_DIR}/include
    ${PROJECT_SOURCE_DIR}/thirdparty/cpp-httplib
    ${PROJECT_SOURCE_DIR}/thirdparty/rapidjson/include
    ${PROJECT_SOURCE_DIR}/thirdparty/spdlog/include
    ${PROJECT_SOURCE_DIR}/thirdparty/hnswlib
    ${PROJECT_SOURCE_DIR}/thirdparty/rocksdb/include    
)


# 加载子目录
add_subdirectory(src)