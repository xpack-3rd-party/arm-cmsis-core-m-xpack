#
# This file is part of the µOS++ distribution.
#   (https://github.com/micro-os-plus)
# Copyright (c) 2021 Liviu Ionescu
#
# Permission to use, copy, modify, and/or distribute this software
# for any purpose is hereby granted, under the terms of the MIT license.
#
# -----------------------------------------------------------------------------

# https://cmake.org/cmake/help/v3.19/
# https://cmake.org/cmake/help/v3.19/manual/cmake-packages.7.html#package-configuration-file
cmake_minimum_required(VERSION 3.19)

# Use targets as include markers (variables are not scope independent).
if(TARGET xpack-3rd-party-arm-cmsis-core-m-included)
  return()
else()
  add_custom_target(xpack-3rd-party-arm-cmsis-core-m-included)
endif()

if(NOT TARGET micro-os-plus-build-helper-included)
  message(FATAL_ERROR "Include the mandatory build-helper (xpacks/micro-os-plus-build-helper/cmake/xpack-helper.cmake)")
endif()

# message(STATUS "Processing xPack ${PACKAGE_JSON_NAME}@${PACKAGE_JSON_VERSION}...")

# -----------------------------------------------------------------------------
# The current folder.

get_filename_component(xpack_current_folder ${CMAKE_CURRENT_LIST_DIR} DIRECTORY)

# -----------------------------------------------------------------------------

if(NOT TARGET xpack-3rd-party-arm-cmsis-core-m-interface)

  # https://cmake.org/cmake/help/v3.19/command/add_library.html?highlight=interface#interface-libraries
  add_library(xpack-3rd-party-arm-cmsis-core-m-interface INTERFACE EXCLUDE_FROM_ALL)

  # ---------------------------------------------------------------------------

  # xpack_glob_recurse_cxx(source_files "${xpack_current_folder}/src")
  # xpack_display_relative_paths("${source_files}" "${xpack_current_folder}")

  target_sources(
    xpack-3rd-party-arm-cmsis-core-m-interface

    INTERFACE
      # ${source_files}
  )

  target_include_directories(
    xpack-3rd-party-arm-cmsis-core-m-interface

    INTERFACE
      # The only contribution of this package is a folder with headers.
      ${xpack_current_folder}/CMSIS/Core/Include
  )

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
  message(STATUS "=> xpack-3rd-party::arm-cmsis-core-m (xpack-3rd-party-arm-cmsis-core-m-interface)")

endif()

# -----------------------------------------------------------------------------

