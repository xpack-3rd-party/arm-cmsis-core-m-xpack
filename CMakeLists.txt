#
# This file is part of the µOS++ distribution.
#   (https://github.com/micro-os-plus)
# Copyright (c) 2022 Liviu Ionescu
#
# Permission to use, copy, modify, and/or distribute this software
# for any purpose is hereby granted, under the terms of the MIT license.
#
# -----------------------------------------------------------------------------

# This file is intended to be consumed by applications with:
#
# `find_package(xpack-3rd-party-arm-cmsis-core-m REQUIRED)`
#
# or, if CMake packages are not used, manually with:
#
# `add_subdirectory("xpacks/xpack-3rd-party-arm-cmsis-core-m")`
#
# The result is a library that can be added to the linker with:
#
# `target_link_libraries(your-target PUBLIC xpack-3rd-party::arm-cmsis-core-m)`
#
# To avoid poluting this file with test related details, there is a separate
# CMake configuration in the `tests` folder.

# -----------------------------------------------------------------------------

# https://cmake.org/cmake/help/v3.20/
cmake_minimum_required(VERSION 3.20)

project(
  xpack-3rd-party-arm-cmsis-core-m
  DESCRIPTION "Arm CMSIS Core-M"
)

# PRIVATE: build definitions, used internally
# INTERFACE: usage definitions, passed up to targets linking to it
# PUBLIC: both

if(COMMAND xpack_get_package_name_and_version)
  xpack_get_package_name_and_version("${CMAKE_CURRENT_SOURCE_DIR}/package.json")
  message(VERBOSE "Processing xPack ${PACKAGE_JSON_NAME}@${PACKAGE_JSON_VERSION}...")
endif()

# -----------------------------------------------------------------------------

# https://cmake.org/cmake/help/v3.20/command/add_library.html?highlight=interface#interface-libraries
add_library(xpack-3rd-party-arm-cmsis-core-m-interface INTERFACE EXCLUDE_FROM_ALL)

# ---------------------------------------------------------------------------

target_sources(
  xpack-3rd-party-arm-cmsis-core-m-interface

  INTERFACE
    # ...
)

target_include_directories(
  xpack-3rd-party-arm-cmsis-core-m-interface

  INTERFACE
    # The only contribution of this package is a folder with headers.
    "CMSIS/Core/Include"
)

message(VERBOSE "+ CMSIS/Core/Include")

target_compile_definitions(
  xpack-3rd-party-arm-cmsis-core-m-interface

  INTERFACE
    # Workaround to avoid
    # https://github.com/ARM-software/CMSIS_5/issues/1397
    # cmsis_gcc.h:133:15: error: nested extern declaration of '_start' [-Werror=nested-externs]
    __PROGRAM_START
)

target_compile_options(
  xpack-3rd-party-arm-cmsis-core-m-interface

  INTERFACE
    # Perhaps ignore some warnings.
)

target_link_libraries(
  xpack-3rd-party-arm-cmsis-core-m-interface

  INTERFACE
    # Dependencies
)

# -------------------------------------------------------------------------
# Aliases.

add_library(xpack-3rd-party::arm-cmsis-core-m ALIAS xpack-3rd-party-arm-cmsis-core-m-interface)
message(VERBOSE "xpack-3rd-party::arm-cmsis-core-m -> xpack-3rd-party-arm-cmsis-core-m-interface")

# -----------------------------------------------------------------------------
