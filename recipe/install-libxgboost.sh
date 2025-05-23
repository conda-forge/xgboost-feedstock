#!/bin/bash


pushd build-target

    cmake --install .

    rm -fv "${PREFIX}/lib/libdmlc.a"
    rm -fv "${LIBRARY_PREFIX}/mingw-w64/lib/dmlc.lib"

popd
