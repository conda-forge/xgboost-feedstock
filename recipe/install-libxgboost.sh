#!/bin/bash

echo "here 1"
if [[ ${OSTYPE} == msys ]]; then
  # Just for now; should we handle slash fixing in conda-build?
  PREFIX=${PREFIX//\\//}
  SRC_DIR=${SRC_DIR//\\//}
fi

echo "here 2"
if [[ ${OSTYPE} == msys ]]; then
  LIBDIR=${PREFIX}/Library/mingw-w64/lib
  INCDIR=${PREFIX}/Library/mingw-w64/include
  BINDIR=${PREFIX}/Library/mingw-w64/bin
  SODIR=${BINDIR}
  XGBOOSTDSO=xgboost.dll
  EXEEXT=.exe
else
  LIBDIR=${PREFIX}/lib
  INCDIR=${PREFIX}/include
  BINDIR=${PREFIX}/bin
  SODIR=${LIBDIR}
  if [[ $(uname) == Darwin ]]; then
    XGBOOSTDSO=libxgboost.dylib
  else
    XGBOOSTDSO=libxgboost.so
  fi
  EXEEXT=
fi

echo "here 3"
mkdir -p ${LIBDIR} ${INCDIR}/xgboost ${BINDIR} || true
echo "here 4"
cp -f ${SRC_DIR}/lib/*.a ${LIBDIR}/  || true
echo "here 5"
cp ${SRC_DIR}/xgboost${EXEEXT} ${BINDIR}/
echo "here 6"
cp ${SRC_DIR}/lib/${XGBOOSTDSO} ${SODIR}/
echo "here 7"
cp -Rf ${SRC_DIR}/include/xgboost ${INCDIR}/
echo "here 8"
cp -Rf ${SRC_DIR}/rabit/include/rabit ${INCDIR}/xgboost/
echo "here 9"
cp -f ${SRC_DIR}/src/c_api/*.h ${INCDIR}/xgboost/
echo "here 10"