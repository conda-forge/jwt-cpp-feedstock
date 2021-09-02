#!/bin/bash

rm -rf _build
mkdir _build
cd _build

# configure
cmake \
	${SRC_DIR} \
	${CMAKE_ARGS} \
	-DCMAKE_BUILD_TYPE:STRING=Release \
	-DJWT_BUILD_EXAMPLES:BOOL=FALSE \
	-DJWT_BUILD_TESTS:BOOL=FALSE \
	-DJWT_CMAKE_FILES_INSTALL_DIR:PATH=${PREFIX}/lib/cmake/jwt-cpp \
	-DJWT_EXTERNAL_PICOJSON:BOOL=TRUE \
;

# build
cmake --build . --verbose --parallel ${CPU_COUNT}

# install
cmake --build . --verbose --parallel ${CPU_COUNT} --target install
