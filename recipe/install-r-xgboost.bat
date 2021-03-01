@echo on
pushd %SRC_DIR%\R-package
%R% CMD INSTALL --preclean --build .
if errorlevel 1 exit 1