#!/bin/bash

set -exuo pipefail

mkdir -p build-target

if [[ ${cuda_compiler_version} != "None" ]]; then
    export CMAKE_ARGS="-DUSE_CUDA=ON -DUSE_NCCL=ON -DBUILD_WITH_SHARED_NCCL=ON ${CMAKE_ARGS}"
fi

pushd build-target
cmake ${CMAKE_ARGS} \
      -GNinja \
      -DCMAKE_BUILD_TYPE:STRING="Release" \
      -DCMAKE_POSITION_INDEPENDENT_CODE:BOOL=ON \
      -DCMAKE_INSTALL_PREFIX:PATH="${PREFIX}" \
      "${SRC_DIR}"
ninja
popd
