#!/bin/bash

# http://xgboost.readthedocs.io/en/latest/build.html

if [[ $(uname) == Darwin ]]
then
    # make sure cmake can compile openmp code with clang
    export DYLD_FALLBACK_LIBRARY_PATH=${PREFIX}/lib
    clang_version=`${CC} --version | grep "clang version" | cut -d " " -f 3`
fi

{
  cmake \
    -G "Unix Makefiles" \
    -D CMAKE_BUILD_TYPE:STRING="Release" \
    -D CMAKE_POSITION_INDEPENDENT_CODE:BOOL=ON \
    -D CMAKE_INSTALL_PREFIX:PATH="${PREFIX}" \
    "${SRC_DIR}"
} || {
  cat $SRC_DIR/CMakeFiles/CMakeOutput.log
  cat $SRC_DIR/CMakeFiles/CMakeError.log
  exit 1
}
make -j${CPU_COUNT}
