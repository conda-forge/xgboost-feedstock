#!/bin/bash

# http://xgboost.readthedocs.io/en/latest/build.html

if [[ ${OSTYPE} == msys ]]; then
  if [[ "${ARCH}" == "32" ]]; then
    # SSE2 is used and we get called from MSVC
    # CPython so 32-bit GCC needs realignment.
    export CC="gcc -mstackrealign"
    export CXX="g++ -mstackrealign"
  fi
  cp make/mingw64.mk config.mk
else
  cp make/config.mk config.mk
fi

# XGBoost uses its own compilation flags.
echo "ADD_LDFLAGS = ${LDFLAGS}" >> config.mk
echo "ADD_CFLAGS = ${CFLAGS}" >> config.mk

# this seems to be expected by clang when linking
if [[ $(uname) == Darwin ]]
then
    ln -s ${PREFIX}/lib/libomp.dylib ${PREFIX}/lib/libgomp.dylib

    # post-link and pre-unlink scripts that make the link above when the
    # package is installed
    cp ${RECIPE_DIR}/libxgboost-post-link.sh ${PREFIX}/bin/.libxgboost-post-link.sh
    cp ${RECIPE_DIR}/libxgboost-pre-unlink.sh ${PREFIX}/bin/.libxgboost-pre-unlink.sh
fi

make -j${CPU_COUNT}
