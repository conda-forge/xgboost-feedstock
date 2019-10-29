#!/bin/bash

if [[ ${OSTYPE} == msys ]]; then
  # Just for now; should we handle slash fixing in conda-build?
  PREFIX=${PREFIX//\\//}
  SRC_DIR=${SRC_DIR//\\//}
fi

if [[ ${OSTYPE} == msys ]]; then
  LIBDIR=${PREFIX}/Library/mingw-w64/lib
else
  LIBDIR=${PREFIX}/lib
fi

mkdir -p ${LIBDIR}/R || true
cp -Rf ${SRC_DIR}/lib/R ${LIBDIR}/R/
