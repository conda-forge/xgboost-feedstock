#!/bin/bash


pushd build-target

    cmake --install .

    rm -fv "${PREFIX}/lib/libdmlc.a"
    rm -rfv "${PREFIX}/include/dmlc"
    rm -rfv "${PREFIX}/lib/cmake/dmlc"
    rm -fv "${LIBRARY_PREFIX}/mingw-w64/lib/dmlc.lib"
    rm -rfv "${LIBRARY_PREFIX}/mingw-w64/lib/cmake/dmlc"
    rm -rfv "${LIBRARY_PREFIX}/mingw-w64/include/dmlc"

popd
