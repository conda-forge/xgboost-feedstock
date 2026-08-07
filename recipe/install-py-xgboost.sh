#!/bin/bash


pushd ${SRC_DIR}/python-package

    ${PYTHON} -m pip install . -vv \
        -C=cmake.define.XGBOOST_USE_SYSTEM_LIBXGBOOST=ON -Cwheel.platlib=false

popd
