# 定义一个SRC_LIST变量，包含该目录下所有源文件
aux_source_directory(. SRC_LIST)

# 创建可执行文件
add_executable(vdb ${SRC_LIST})

# 指定库文件的查找路径
link_directories(
    /usr/local/lib
    /home/u/faiss/build/lib  # Faiss 库文件路径
    ${PROJECT_SOURCE_DIR}/thirdparty/cpp-httplib
    ${PROJECT_SOURCE_DIR}/thirdparty/rapidjson
    ${PROJECT_SOURCE_DIR}/thirdparty/spdlog
    ${PROJECT_SOURCE_DIR}/thirdparty/hnswlib
    ${PROJECT_SOURCE_DIR}/thirdparty/rocksdb    
)


# 查找 Faiss 和 OpenMP
find_package(Faiss REQUIRED)
find_package(OpenMP REQUIRED)

# 指定可执行文件链接时需要依赖的库文件
target_link_libraries(vdb
    OpenMP::OpenMP_CXX
    faiss
    ${PROJECT_SOURCE_DIR}/thirdparty/rocksdb/librocksdb.so 
    # cpp-httplib
    # rapidjson
    # spdlog
    # 如果 cpp-httplib, rapidjson, spdlog 是静态库，可以直接指定路径：
    # ${PROJECT_SOURCE_DIR}/thirdparty/cpp-httplib/libcpp-httplib.a
    # ${PROJECT_SOURCE_DIR}/thirdparty/rapidjson/librapidjson.a
    # ${PROJECT_SOURCE_DIR}/thirdparty/spdlog/libspdlog.a
)
