# -----------------------------------------------------------------------------
#
# This file is part of the µOS++ distribution.
#   (https://github.com/micro-os-plus/)
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
# `subdir('xpacks/xpack-3rd-party-arm-cmsis-core')`
#
# The result is a dependency that can be referred as:
#
# `dependencies: [xpack_3rd_party_arm_cmsis_core_m_dependency],`
#
# Similarly for Cortex-A:
#
# `dependencies: [xpack_3rd_party_arm_cmsis_core_a_dependency],`

# Note: the meson configuration is provided only as a proof of concept,
# for production it might need some refinements.

# -----------------------------------------------------------------------------

message('Processing xPack @xpack-3rd-party/arm-cmsis-core-...')

# https://mesonbuild.com/Reference-manual_functions.html#declare_dependency
xpack_3rd_party_arm_cmsis_core_m_dependency = declare_dependency(
  include_directories: include_directories(
    'CMSIS/Core/Include',
  ),
  sources: files(
  ),
  compile_args: [
    # Workaround to avoid -Werror=nested-externs
    '-D__PROGRAM_START',
  ],
)

message('+ -I CMSIS/Core/Include')
message('+ -D __PROGRAM_START')
message('> xpack_3rd_party_arm_cmsis_core_m_dependency')

# -----------------------------------------------------------------------------

xpack_3rd_party_arm_cmsis_core_a_dependency = declare_dependency(
  include_directories: include_directories(
    'CMSIS/Core_A/Include',
  ),
  sources: files(
  ),
  compile_args: [
    # Workaround to avoid -Werror=nested-externs
    '-D__PROGRAM_START',
  ],
)

message('+ -I CMSIS/Core_A/Include')
message('+ -D __PROGRAM_START')
message('> xpack_3rd_party_arm_cmsis_core_a_dependency')

# -----------------------------------------------------------------------------
