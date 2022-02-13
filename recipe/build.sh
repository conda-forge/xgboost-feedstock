#!/bin/bash

set -exuo pipefail

mkdir -p build-target

pushd build-target
if [[ ${cuda_compiler_version} != "None" ]]; then
    cmake ${CMAKE_ARGS} \
          -GNinja \
          -DUSE_CUDA=ON \
          -DCMAKE_BUILD_TYPE:STRING="Release" \
          -DCMAKE_POSITION_INDEPENDENT_CODE:BOOL=ON \
          -DCMAKE_INSTALL_PREFIX:PATH="${PREFIX}" \
          "${SRC_DIR}"
else
    cmake ${CMAKE_ARGS} \
          -GNinja \
          -DCMAKE_BUILD_TYPE:STRING="Release" \
          -DCMAKE_POSITION_INDEPENDENT_CODE:BOOL=ON \
          -DCMAKE_INSTALL_PREFIX:PATH="${PREFIX}" \
          "${SRC_DIR}"
fi

ninja
popd
