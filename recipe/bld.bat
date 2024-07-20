mkdir "%SRC_DIR%"\build
pushd "%SRC_DIR%"\build

if not "%cuda_compiler_version%"=="None" (
    set "CMAKE_ARGS=-DUSE_CUDA=ON %CMAKE_ARGS%"
)

cmake -G "Ninja" ^
    %CMAKE_ARGS% ^
    -DCMAKE_BUILD_TYPE:STRING="Release" ^
    -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
    -DCMAKE_POSITION_INDEPENDENT_CODE:BOOL=ON ^
    -DR_LIB=OFF ^
    "%SRC_DIR%"
if errorlevel 1 exit 1

cmake --build . --target install --config Release
if errorlevel 1 exit 1

popd
