set BUILD_DIR=%SRC_DIR%\_build
mkdir "%BUILD_DIR%"

:: configure
cmake ^
  -G "Ninja" ^
  -DCMAKE_BUILD_TYPE:STRING=Release ^
  -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ^
  -DJWT_BUILD_EXAMPLES:BOOL=FALSE ^
  -DJWT_BUILD_TESTS:BOOL=FALSE ^
  -DJWT_CMAKE_FILES_INSTALL_DIR:PATH="%LIBRARY_PREFIX%\lib\cmake\jwt-cpp" ^
  -DJWT_EXTERNAL_PICOJSON:BOOL=TRUE ^
  -B "%BUILD_DIR%" ^
  -S "%SRC_DIR%"
if errorlevel 1 exit 1

:: build
cmake --build "%BUILD_DIR%" --verbose --parallel "%CPU_COUNT%"
if errorlevel 1 exit 1

:: install
cmake --build "%BUILD_DIR%" --verbose --parallel "%CPU_COUNT%" --target install
if errorlevel 1 exit 1
