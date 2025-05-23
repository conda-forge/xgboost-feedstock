#!/bin/bash


pushd build-target

    cmake --install .

    rm -fv "${PREFIX}/lib/libdmlc.a"
    rm -fv "${PREFIX}/include/dmlc"
    rm -fv "${LIBRARY_PREFIX}/mingw-w64/lib/dmlc.lib"
    rm -fv "${LIBRARY_PREFIX}/mingw-w64/include/dmlc"

popd
