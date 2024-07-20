#!/bin/bash

pushd ${SRC_DIR}/python-package
  python -m pip install . -vv --config-settings use_system_libxgboost=True
popd
