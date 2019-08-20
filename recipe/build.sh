#!/bin/bash

# http://xgboost.readthedocs.io/en/latest/build.html

# if [[ $(uname) == Darwin ]]
# then
#     # this seems to be expected by clang when linking
#     ln -s ${PREFIX}/lib/libomp.dylib ${PREFIX}/lib/libgomp.dylib
# fi

cmake -G "Unix Makefiles" \
      -D CMAKE_BUILD_TYPE:STRING="Release" \
      -D CMAKE_POSITION_INDEPENDENT_CODE:BOOL=ON \
      -D CMAKE_INSTALL_PREFIX:PATH="${PREFIX}" \
      -D VERBOSE=ON \
      -D CMAKE_VERBOSE_MAKEFILE=ON \
      --debug-output \
      "${SRC_DIR}"
make -j${CPU_COUNT}
