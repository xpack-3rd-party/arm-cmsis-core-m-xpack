#
# This file is part of the µOS++ distribution.
#   (https://github.com/micro-os-plus)
# Copyright (c) 2022 Liviu Ionescu
#
# Permission to use, copy, modify, and/or distribute this software
# for any purpose is hereby granted, under the terms of the MIT license.
#
# If a copy of the license was not distributed with this file, it can
# be obtained from https://opensource.org/licenses/MIT/.
#
# -----------------------------------------------------------------------------

# This file is intended to be consumed by applications with:
#
# `add_subdirectory("xpacks/xpack-3rd-party-arm-cmsis-core-m")`
#
# The result is an interface library that can be added to the linker with:
#
# `target_link_libraries(your-target PUBLIC xpack-3rd-party::arm-cmsis-core-m)`

# -----------------------------------------------------------------------------

# https://cmake.org/cmake/help/v3.20/
cmake_minimum_required(VERSION 3.20)

project(
  xpack-3rd-party-arm-cmsis-core-m
  DESCRIPTION "Arm CMSIS Core-M headers"
)

if(COMMAND xpack_get_package_name_and_version)
  xpack_get_package_name_and_version("${CMAKE_CURRENT_SOURCE_DIR}/package.json")
  message(VERBOSE "Processing xPack ${PACKAGE_JSON_NAME}@${PACKAGE_JSON_VERSION}...")
endif()

# -----------------------------------------------------------------------------
## The project library definitions ##

# https://cmake.org/cmake/help/v3.20/command/add_library.html?highlight=interface#normal-libraries
# PRIVATE: build definitions, used internally
# INTERFACE: usage definitions, passed up to targets linking to it
# PUBLIC: both

add_library(xpack-3rd-party-arm-cmsis-core-m-interface INTERFACE EXCLUDE_FROM_ALL)

# -----------------------------------------------------------------------------
# Target settings.

# The only contribution of this package is a folder with headers.
target_include_directories(
  xpack-3rd-party-arm-cmsis-core-m-interface

  INTERFACE
    "CMSIS/Core/Include"
)

message(VERBOSE "+ -I CMSIS/Core/Include")

target_sources(
  xpack-3rd-party-arm-cmsis-core-m-interface

  INTERFACE
    # ...
)

target_compile_definitions(
  xpack-3rd-party-arm-cmsis-core-m-interface

  INTERFACE
    # Workaround to avoid
    # https://github.com/ARM-software/CMSIS_5/issues/1397
    # cmsis_gcc.h:133:15: error: nested extern declaration of '_start' [-Werror=nested-externs]
    __PROGRAM_START
)
message(VERBOSE "+ -D __PROGRAM_START")

target_compile_options(
  xpack-3rd-party-arm-cmsis-core-m-interface

  INTERFACE
    # ... perhaps ignore some warnings.
)

target_link_libraries(
  xpack-3rd-party-arm-cmsis-core-m-interface

  INTERFACE
    # Dependencies
    # ... list all dependencies.
)

# -----------------------------------------------------------------------------
# Aliases.

# https://cmake.org/cmake/help/v3.20/command/add_library.html#alias-libraries
add_library(xpack-3rd-party::arm-cmsis-core-m ALIAS xpack-3rd-party-arm-cmsis-core-m-interface)
message(VERBOSE "> xpack-3rd-party::arm-cmsis-core-m -> xpack-3rd-party-arm-cmsis-core-m-interface")

# -----------------------------------------------------------------------------
