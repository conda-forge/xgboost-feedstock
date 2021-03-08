#!/bin/bash

(
  export CC=$CC_FOR_BUILD
  export CXX=$CXX_FOR_BUILD
  export AR=($CC_FOR_BUILD -print-prog-name=ar)
  export NM=($CC_FOR_BUILD -print-prog-name=nm)
  export LDFLAGS=${LDFLAGS//$PREFIX/$BUILD_PREFIX}
  unset CFLAGS
  unset CXXFLAGS
  unset CPPFLAGS

  mkdir build-build
  pushd build-build
  cmake ${CMAKE_ARGS} \
    -GNinja \
    -DCMAKE_BUILD_TYPE:STRING="Release" \
    -DCMAKE_POSITION_INDEPENDENT_CODE:BOOL=ON \
    -DCMAKE_INSTALL_PREFIX:PATH="${CONDA_PREFIX}" \
    -DUSE_OPENMP=OFF \
    "${SRC_DIR}"
  ninja install
  popd
)

pushd ${SRC_DIR}/R-package
  # Remove src/Makevars.win because it says:
  # This file is only used for windows compilation from github
  # It will be replaced with Makevars.in for the CRAN version
  # rm src/Makevars.win
  # shellcheck disable=SC2086
  ac_cv_lib_execinfo_backtrace=no
  ${R} CMD INSTALL --build . ${R_ARGS}
popd
