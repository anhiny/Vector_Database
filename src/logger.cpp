#include "logger.h"
#include "spdlog/logger.h"
#include "spdlog/sinks/stdout_color_sinks.h"
#include <memory>

std::shared_ptr<spdlog::logger> GlobalLogger;

void init_global_logger() {
    GlobalLogger = spdlog::stderr_color_mt("GlobalLogger");
}

void set_log_level(spdlog::level::level_enum log_lever) {
    GlobalLogger->set_level(log_lever);
}