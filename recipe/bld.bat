mkdir "%SRC_DIR%"\build
pushd "%SRC_DIR%"\build

if not "%cuda_compiler_version%" == "None" (
    set "CMAKE_ARGS=-DUSE_CUDA=ON %CMAKE_ARGS%"

    :: Workaround CUB build errors on CUDA 11.8
    if not "%cuda_compiler_version%" == "11.8" (
        set "CXXFLAGS=%CXXFLAGS% -DWIN32_LEAN_AND_MEAN"
        set "NVCC_APPEND_FLAGS=%NVCC_APPEND_FLAGS% -DWIN32_LEAN_AND_MEAN"
    )
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
