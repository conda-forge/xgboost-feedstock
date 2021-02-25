copy "%RECIPE_DIR%\install-%PKG_NAME%.sh" .
if %errorlevel% neq 0 exit /b %errorlevel%

set PREFIX=%PREFIX:\=/%
set SRC_DIR=%SRC_DIR:\=/%
set MSYSTEM=MINGW%ARCH%
set MSYS2_PATH_TYPE=inherit
set CHERE_INVOKING=1

bash -lc "./install-%PKG_NAME%.sh"
if %errorlevel% neq 0 exit /b %errorlevel%

exit /b 0