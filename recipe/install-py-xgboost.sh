#!/bin/bash

. activate "${PREFIX}"

pushd ${SRC_DIR}/python-package
  ${PYTHON} setup.py install --use-system-libxgboost --single-version-externally-managed --record=record.txt
popd
