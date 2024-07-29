#!/bin/bash

pushd ${SRC_DIR}/R-package
  ${R} CMD INSTALL --preclean --build . --configure-args="CXXFLAGS=-D_LIBCPP_DISABLE_AVAILABILITY" ${R_ARGS}
popd
