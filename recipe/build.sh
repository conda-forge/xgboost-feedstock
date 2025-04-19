#!/bin/bash

set -exuo pipefail

XGB_CMAKE_ARGS=()
if [[ "$target_platform" == osx-* ]]
then
    XGB_CMAKE_ARGS=(
        -DOpenMP_C_FLAGS:STRING="-Xpreprocessor -fopenmp -I${PREFIX}/include"
        -DOpenMP_CXX_FLAGS:STRING="-Xpreprocessor -fopenmp -I${PREFIX}/include"
        -DOpenMP_C_LIB_NAMES:LIST="libomp"
        -DOpenMP_CXX_LIB_NAMES:LIST="libomp"
        -DOpenMP_libomp_LIBRARY:PATH="${PREFIX}/lib/libomp.dylib"
        ${XGB_CMAKE_ARGS[@]+"${XGB_CMAKE_ARGS[@]}"}
    )
fi
if [[ ${cuda_compiler_version} != "None" ]]; then
    XGB_CMAKE_ARGS=(
        -DUSE_CUDA:BOOL=ON
        -DUSE_NCCL:BOOL=ON
        -DBUILD_WITH_SHARED_NCCL:BOOL=ON
        ${XGB_CMAKE_ARGS[@]+"${XGB_CMAKE_ARGS[@]}"}
    )
fi

# Limit number of threads used to avoid hardware oversubscription
if [[ "${target_platform}" == "linux-aarch64" ]] || [[ "${target_platform}" == "linux-ppc64le" ]]; then
    export CMAKE_BUILD_PARALLEL_LEVEL=6
fi

mkdir -p build-target
pushd build-target

    cmake -G "Ninja" \
          ${CMAKE_ARGS} \
          ${XGB_CMAKE_ARGS[@]+"${XGB_CMAKE_ARGS[@]}"} \
          -DCMAKE_BUILD_TYPE:STRING="Release" \
          -DCMAKE_INSTALL_PREFIX:PATH="${PREFIX}" \
          -DCMAKE_POSITION_INDEPENDENT_CODE:BOOL=ON \
          -DCMAKE_CXX_FLAGS:STRING="-D_LIBCPP_DISABLE_AVAILABILITY" \
          "${SRC_DIR}"
    cmake --build .

    rm dmlc-core/libdmlc.a

popd
