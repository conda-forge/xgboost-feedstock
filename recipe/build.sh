#!/bin/bash

set -exuo pipefail

mkdir -p build-target

XGB_CMAKE_ARGS=()

if [[ "$target_platform" == osx-* ]]
then
    XGB_CMAKE_ARGS=(-DOpenMP_C_FLAGS="-Xpreprocessor -fopenmp -I${PREFIX}/include" -DOpenMP_CXX_FLAGS="-Xpreprocessor -fopenmp -I${PREFIX}/include" -DOpenMP_C_LIB_NAMES=libomp -DOpenMP_CXX_LIB_NAMES=libomp -DOpenMP_libomp_LIBRARY=${PREFIX}/lib/libomp.dylib ${XGB_CMAKE_ARGS[@]+"${XGB_CMAKE_ARGS[@]}"} )
fi


if [[ ${cuda_compiler_version} != "None" ]]; then
    XGB_CMAKE_ARGS=(-DUSE_CUDA=ON -DUSE_NCCL=ON -DBUILD_WITH_SHARED_NCCL=ON ${XGB_CMAKE_ARGS[@]+"${XGB_CMAKE_ARGS[@]}"} )
fi

# Federated learning support
XGB_CMAKE_ARGS=(-DPLUGIN_FEDERATED=ON ${XGB_CMAKE_ARGS[@]+"${XGB_CMAKE_ARGS[@]}"} )

# point to a usable protoc/grpc_cpp_plugin if we're cross-compiling
if [[ "${build_platform}" != "${target_platform}" ]]; then
    XGB_CMAKE_ARGS=(-DProtobuf_PROTOC_EXECUTABLE=$BUILD_PREFIX/bin/protoc ${XGB_CMAKE_ARGS[@]+"${XGB_CMAKE_ARGS[@]}"} )
    sed -ie "s;protoc-gen-grpc.*$;protoc-gen-grpc=${BUILD_PREFIX}/bin/grpc_cpp_plugin\";g" plugin/federated/CMakeLists.txt
fi

# Limit number of threads used to avoid hardware oversubscription
if [[ "${target_platform}" == "linux-aarch64" ]] || [[ "${target_platform}" == "linux-ppc64le" ]]; then
    export CMAKE_BUILD_PARALLEL_LEVEL=6
fi

pushd build-target
cmake ${CMAKE_ARGS} ${XGB_CMAKE_ARGS[@]+"${XGB_CMAKE_ARGS[@]}"} \
      -GNinja \
      -DCMAKE_BUILD_TYPE:STRING="Release" \
      -DCMAKE_POSITION_INDEPENDENT_CODE:BOOL=ON \
      -DCMAKE_INSTALL_PREFIX:PATH="${PREFIX}" \
      -DCMAKE_CXX_FLAGS="-D_LIBCPP_DISABLE_AVAILABILITY" \
      "${SRC_DIR}"
cmake --build . --config Release
popd
