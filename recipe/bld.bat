@echo on

mkdir %SRC_DIR%\build
pushd %SRC_DIR%\build

:: CCCL has different logic depending on the `__cplusplus` macro.
:: However Visual Studio leaves `__cplusplus` as `199711L` by default.
:: As a result code paths needing new C++ standard won't be run.
:: This happens in spite of the fact that VS 2019 & 2022 default to C++14.
:: To make sure `__cplusplus` matches, we pass an additional flag to VC.
:: Ideally other tooling would do this for us, for now we do it ourselves.
::
:: https://devblogs.microsoft.com/cppblog/msvc-now-correctly-reports-__cplusplus/
:: https://learn.microsoft.com/en-us/cpp/build/reference/zc-cplusplus?view=msvc-160
:: https://learn.microsoft.com/en-us/cpp/build/reference/zc-cplusplus?view=msvc-170
:: https://github.com/NVIDIA/cccl/blob/82a3ed0282893d6316abde04394f59a9a37a3747/libcudacxx/include/nv/target#L27-L30
:: https://github.com/NVIDIA/cutlass/issues/1403#issuecomment-2130383392
:: https://gitlab.kitware.com/cmake/cmake/-/issues/18837
set "CXXFLAGS=%CXXFLAGS% /Zc:__cplusplus"
set "CUDAFLAGS=%CUDAFLAGS% -Xcompiler /Zc:__cplusplus"

if not "%cuda_compiler_version%" == "None" (
    set "CMAKE_ARGS=-DUSE_CUDA=ON %CMAKE_ARGS%"
)

cmake -G "Ninja" ^
    %CMAKE_ARGS% ^
    -DCMAKE_BUILD_TYPE:STRING="Release" ^
    -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ^
    -DCMAKE_POSITION_INDEPENDENT_CODE:BOOL=ON ^
    -DR_LIB:BOOL=OFF ^
    "%SRC_DIR%"
if errorlevel 1 exit 1

cmake --build . --target install --config Release -- -v
if errorlevel 1 exit 1

popd
