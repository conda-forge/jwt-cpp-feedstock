mkdir _build
cd _build

:: configure
cmake ^
	"%SRC_DIR%" ^
	-G "Ninja" ^
	-DCMAKE_BUILD_TYPE:STRING=Release ^
	-DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ^
	-DBUILD_TESTS:BOOL=FALSE ^
	-DEXTERNAL_PICOJSON:BOOL=TRUE ^
	-DJWT_CMAKE_FILES_INSTALL_DIR:PATH="%LIBRARY_PREFIX%\lib\cmake\jwt-cpp"
if %ERRORLEVEL% NEQ 0 exit 1

:: build
cmake --build . --verbose --parallel "%CPU_COUNT%"
if %ERRORLEVEL% NEQ 0 exit 1

:: install
cmake --build . --verbose --parallel "%CPU_COUNT%" --target install
if %ERRORLEVEL% NEQ 0 exit 1
