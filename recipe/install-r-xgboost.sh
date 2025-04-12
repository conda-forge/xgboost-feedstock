#!/bin/bash

pushd ${SRC_DIR}/R-package

  ${R} CMD INSTALL --preclean --build . ${R_ARGS}

popd
