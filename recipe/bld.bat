@echo on

sed -i.bak "s@\"objdump\"@\"%OBJDUMP%\"@g" R-package\inst\make-r-def.R
if errorlevel 1 exit 1

mkdir %SRC_DIR%\build
pushd %SRC_DIR%\build

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
