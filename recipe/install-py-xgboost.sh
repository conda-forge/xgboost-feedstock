#!/bin/bash


pushd ${SRC_DIR}/python-package

    # Remove NCCL dependency
    ${PYTHON} ${SRC_DIR}/ops/script/pypi_variants.py --use-suffix=na --require-nccl-dep=na
    ${PYTHON} -m pip install . -vv \
        --config-settings=cmake.define.XGBOOST_USE_SYSTEM_LIBXGBOOST=ON --config-settings=wheel.platlib=false

popd
