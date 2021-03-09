#!/bin/bash

set -exuo pipefail

mkdir -p build-target
pushd build-target
  cmake ${CMAKE_ARGS} \
    -GNinja \
    -DCMAKE_BUILD_TYPE:STRING="Release" \
    -DCMAKE_POSITION_INDEPENDENT_CODE:BOOL=ON \
    -DCMAKE_INSTALL_PREFIX:PATH="${PREFIX}" \
    "${SRC_DIR}"
  ninja
popd
