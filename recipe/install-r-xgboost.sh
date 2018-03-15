#!/bin/bash

pushd ${SRC_DIR}/R-package
  ${R} CMD INSTALL --build .
popd
