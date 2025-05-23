#!/bin/bash


pushd build-target

    cmake --install .

    rm dmlc-core/libdmlc.a

popd
