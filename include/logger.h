#pragma once

#include "spdlog/common.h"
#include "spdlog/spdlog.h"
#include <memory>

extern std::shared_ptr<spdlog::logger> GlobalLogger;

void init_global_logger();

void set_log_level(spdlog::level::level_enum log_lever);