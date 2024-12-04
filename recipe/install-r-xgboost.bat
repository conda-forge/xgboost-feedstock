@echo on
mkdir "%SRC_DIR%"\build-r
pushd "%SRC_DIR%"\build-r

:: set PATH=%LIBRARY_PREFIX%\bin;%PATH%

cmake -G "Ninja" ^
    -DCMAKE_BUILD_TYPE:STRING="Release" ^
    -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
    -DCMAKE_POSITION_INDEPENDENT_CODE:BOOL=ON ^
    -DDLLTOOL_EXE=%BUILD_PREFIX%\Library\bin\%DLLTOOL% ^
    -DLIBR_CORE_LIBRARY=%PREFIX%\lib\R\bin\x64\R.lib ^
    -DR_LIB=ON ^
    "%SRC_DIR%"
if errorlevel 1 exit 1

cmake --build . --target install --config Release
if errorlevel 1 exit 1

popd
