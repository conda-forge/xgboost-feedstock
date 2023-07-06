#!/bin/bash

pushd ${SRC_DIR}/R-package
  # Remove src/Makevars.win because it says:
  # This file is only used for windows compilation from github
  # It will be replaced with Makevars.in for the CRAN version
  # rm src/Makevars.win
  ${R} CMD INSTALL --preclean --build . ${R_ARGS}
popd
