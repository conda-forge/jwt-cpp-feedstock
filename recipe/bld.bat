mkdir _build
cd _build

:: configure
cmake ^
	"%SRC_DIR%" ^
	-G "Ninja" ^
	-DCMAKE_BUILD_TYPE:STRING=Release ^
	-DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ^
	-DJWT_BUILD_EXAMPLES:BOOL=FALSE ^
	-DJWT_BUILD_TESTS:BOOL=FALSE ^
	-DJWT_CMAKE_FILES_INSTALL_DIR:PATH="%LIBRARY_PREFIX%\lib\cmake\jwt-cpp" ^
	-DJWT_EXTERNAL_PICOJSON:BOOL=TRUE
if %ERRORLEVEL% NEQ 0 exit 1

:: build
cmake --build . --verbose --parallel "%CPU_COUNT%"
if %ERRORLEVEL% NEQ 0 exit 1

:: install
cmake --build . --verbose --parallel "%CPU_COUNT%" --target install
if %ERRORLEVEL% NEQ 0 exit 1
