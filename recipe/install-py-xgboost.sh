#!/bin/bash


pushd ${SRC_DIR}/python-package

    # Remove NCCL dependency
    ${PYTHON} ${SRC_DIR}/ops/script/pypi_variants.py --use-suffix=na --require-nccl-dep=na
    ${PYTHON} -m pip install . -vv \
        --config-settings=wheel.platlib=false --config-settings=wheel.cmake=false

popd
