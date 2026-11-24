#!/bin/bash

BUILD_DIR=${SRC_DIR}/_build
rm -rf ${BUILD_DIR}
mkdir ${BUILD_DIR}

# configure
cmake \
  ${CMAKE_ARGS} \
  -DCMAKE_BUILD_TYPE:STRING=Release \
  -DJWT_BUILD_EXAMPLES:BOOL=FALSE \
  -DJWT_BUILD_TESTS:BOOL=FALSE \
  -DJWT_CMAKE_FILES_INSTALL_DIR:PATH=${PREFIX}/lib/cmake/jwt-cpp \
  -DJWT_EXTERNAL_PICOJSON:BOOL=TRUE \
  -B ${BUILD_DIR} \
  -S ${SRC_DIR} \
;

# build
cmake --build ${BUILD_DIR} --verbose --parallel ${CPU_COUNT}

# install
cmake --build ${BUILD_DIR} --verbose --parallel ${CPU_COUNT} --target install
