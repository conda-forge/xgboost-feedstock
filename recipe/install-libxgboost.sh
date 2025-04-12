#!/bin/bash

pushd build-target
if [[ ${OSTYPE} == msys ]]; then
  cmake --install . --config Release  --prefix "${PREFIX}/Library/mingw-w64"
else
  cmake --install . --config Release  --prefix "${PREFIX}"
fi
popd
