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
# The result is an interface library that can be added to the linker with:
#
# `target_link_libraries(your-target PUBLIC xpack-3rd-party::arm-cmsis-core-m)`
#
# To avoid poluting this file with test related details, there is a separate
# CMake configuration in the `tests` folder.

# -----------------------------------------------------------------------------

# https://cmake.org/cmake/help/v3.19/
cmake_minimum_required(VERSION 3.19)

project(
  xpack-3rd-party-arm-cmsis-core-m
  DESCRIPTION "Arm CMSIS Core-M"
)

if ("${CMAKE_CURRENT_LIST_DIR}" STREQUAL "${CMAKE_SOURCE_DIR}")
  # Building tests for the current project.
  enable_testing() # Must be called from the project root folder.
  add_subdirectory(tests)
else()
  # If not a standalone project, then a library included in a top project.
  # Reuse the package configuration.
  include("${CMAKE_CURRENT_LIST_DIR}/cmake/xpack-3rd-party-arm-cmsis-core-m-config.cmake")
endif()

# -----------------------------------------------------------------------------
