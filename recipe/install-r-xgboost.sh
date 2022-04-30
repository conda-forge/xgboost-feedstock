#!/bin/bash

mkdir -p ${SRC_DIR}/build-r

pushd ${SRC_DIR}/build-r
  cmake ${CMAKE_ARGS} \
      -GNinja \
      -DCMAKE_BUILD_TYPE:STRING="Release" \
      -DCMAKE_POSITION_INDEPENDENT_CODE:BOOL=ON \
      -DCMAKE_INSTALL_PREFIX:PATH="${PREFIX}" \
      -DR_LIB=ON \
      "${SRC_DIR}"
  cmake --build . --target install --config Release
popd
