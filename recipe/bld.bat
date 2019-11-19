mkdir "%SRC_DIR%"\build
pushd "%SRC_DIR%"\build

cmake -G "Ninja" ^
    -DCMAKE_BUILD_TYPE:STRING="Release" ^
    -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
    -DCMAKE_POSITION_INDEPENDENT_CODE:BOOL=ON ^
    "%SRC_DIR%"

cmake --build . --target install --config Release
popd
