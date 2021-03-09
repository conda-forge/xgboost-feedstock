#!/bin/bash

if [[ "$CONDA_BUILD_CROSS_COMPILATION" == 1 ]]; then
  (
    export CC=$CC_FOR_BUILD
    export CXX=$CXX_FOR_BUILD
    export AR=($CC_FOR_BUILD -print-prog-name=ar)
    export NM=($CC_FOR_BUILD -print-prog-name=nm)
    export LDFLAGS=${LDFLAGS//$PREFIX/$BUILD_PREFIX}
    unset CFLAGS
    unset CXXFLAGS
    unset CPPFLAGS

    mkdir -p build-build
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
fi

pushd ${SRC_DIR}/R-package
  # Remove src/Makevars.win because it says:
  # This file is only used for windows compilation from github
  # It will be replaced with Makevars.in for the CRAN version
  # rm src/Makevars.win
  # shellcheck disable=SC2086
  if [[ "${target_platform}" == "osx-arm64" ]]; then
    ac_cv_lib_execinfo_backtrace=no
  fi
  ${R} CMD INSTALL --build . ${R_ARGS}
popd
