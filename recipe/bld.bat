@echo on

sed -i.bak "s@\"objdump\"@\"%OBJDUMP%\"@g" R-package\inst\make-r-def.R
if errorlevel 1 exit 1

set XGB_CMAKE_ARGS=""
if not "%cuda_compiler_version%" == "None" (
    set "XGB_CMAKE_ARGS=-DUSE_CUDA:BOOL=ON"
    if "%cuda_compiler_version%" == "12.9" (
        rem Disable sm_60 to work around NVIDIA/cccl#7982
        set "CUDAARCHS=70;75;80;86;89;90;100;103;120;121"
    )
)

mkdir build-target
if errorlevel 1 exit 1
pushd build-target
if errorlevel 1 exit 1

    cmake -G "Ninja" ^
          %CMAKE_ARGS% ^
          %XGB_CMAKE_ARGS% ^
          -DCMAKE_BUILD_TYPE:STRING="Release" ^
          -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%\mingw-w64" ^
          -DCMAKE_POSITION_INDEPENDENT_CODE:BOOL=ON ^
          -DR_LIB:BOOL=OFF ^
          "%SRC_DIR%"
    if errorlevel 1 exit 1
    cmake --build .
    if errorlevel 1 exit 1

popd
if errorlevel 1 exit 1
