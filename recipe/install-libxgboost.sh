#!/bin/bash

if [[ ${OSTYPE} == msys ]]; then
  export INSTALL_PREFIX="${PREFIX}/Library/mingw-w64"
else
  export INSTALL_PREFIX="${PREFIX}"
fi

pushd build-target
cmake --install . --config Release  --prefix "${INSTALL_PREFIX}"
popd
