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

if [[ $(uname) == Darwin ]] && [[ ${CC} != "clang" ]]
then
    # this seems to be expected by clang when linking
    ln -s ${PREFIX}/lib/libomp.dylib ${PREFIX}/lib/libgomp.dylib
fi

# XGBoost uses its own compilation flags.
echo "ADD_LDFLAGS = ${LDFLAGS}" >> config.mk
echo "ADD_CFLAGS = ${CFLAGS}" >> config.mk

# disable openmp for os toolchain builds
if [[ $(uname) == Darwin ]] && [[ ${CC} == "clang" ]]
then
    echo "USE_OPENMP = 0" >> config.mk
fi

make -j${CPU_COUNT}
