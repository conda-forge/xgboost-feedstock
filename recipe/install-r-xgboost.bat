@echo on
mkdir "%SRC_DIR%"\build-r
pushd "%SRC_DIR%"\build-r

:: set PATH to search for DLLs in %LIBRARY_PREFIX%\bin before %BUILD_PREFIX%\bin
:: This must be set to avoid a failure in loading the stats package in R. This failure
:: occurs due to loading some DLLs in %BUILD_PREFIX%\bin which are incompatible with
:: our r-base distribution.
set PATH=%LIBRARY_PREFIX%\bin;%PATH%

:: DLLTOOL_EXE must be manually specified because cmake is hard-coded to search
:: for the executable dlltool.exe, but in conda-forge, this executable also
:: includes the architecture in the name

:: LIBR_CORE_LIBRARY must be manually specified so that CMake uses the R.lib
:: provided by r-base.  Otherwise it tries to generate its own R.lib from R.dll
:: which does export the right symbols and causes the package not to load correctly

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
