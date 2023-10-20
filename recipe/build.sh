#!/bin/bash

set -exuo pipefail

mkdir -p build-target

if [[ ${cuda_compiler_version} != "None" ]]; then
    export CMAKE_ARGS="-DUSE_CUDA=ON -DUSE_NCCL=ON -DBUILD_WITH_SHARED_NCCL=ON ${CMAKE_ARGS}"
fi

# Limit number of threads used to avoid hardware oversubscription
if [[ "${target_platform}" == "linux-aarch64" ]] || [[ "${target_platform}" == "linux-ppc64le" ]]; then
    export CMAKE_BUILD_PARALLEL_LEVEL=6
fi

pushd build-target
cmake ${CMAKE_ARGS} \
      -GNinja \
      -DCMAKE_BUILD_TYPE:STRING="Release" \
      -DCMAKE_POSITION_INDEPENDENT_CODE:BOOL=ON \
      -DCMAKE_INSTALL_PREFIX:PATH="${PREFIX}" \
      -DCMAKE_CXX_FLAGS="-D_LIBCPP_DISABLE_AVAILABILITY" \
      "${SRC_DIR}"
cmake --build . --config Release
popd
