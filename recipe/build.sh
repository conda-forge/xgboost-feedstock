#!/bin/bash

# http://xgboost.readthedocs.io/en/latest/build.html
if [[ ${HOST} =~ .*darwin.* ]]; then
  export CXXFLAGS="${CXXFLAGS} -fopenmp"
elif [[ ${OSTYPE} == msys ]]; then
  if [[ "${ARCH}" == "32" ]]; then
    # SSE2 is used and we get called from MSVC
    # CPython so 32-bit GCC needs realignment.
    export CC="gcc -mstackrealign"
    export CXX="g++ -mstackrealign"
  fi
  cp make/mingw64.mk ./config.mk
else
  cp make/config.mk ./config.mk
fi
make -j${CPU_COUNT}
