#!/bin/bash

# http://xgboost.readthedocs.io/en/latest/build.html

{
  cmake \
    -G "Unix Makefiles" \
    -D CMAKE_BUILD_TYPE:STRING="Release" \
    -D CMAKE_POSITION_INDEPENDENT_CODE:BOOL=ON \
    -D CMAKE_INSTALL_PREFIX:PATH="${PREFIX}" \
    -D R_LIB:BOOL=ON \
    "${SRC_DIR}"
} || {
  cat $SRC_DIR/CMakeFiles/CMakeOutput.log
  cat $SRC_DIR/CMakeFiles/CMakeError.log
  exit 1
}
make -j${CPU_COUNT}
