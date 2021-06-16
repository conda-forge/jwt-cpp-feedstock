#!/bin/bash

rm -rf _build
mkdir _build
cd _build

# configure
cmake \
	${SRC_DIR} \
	${CMAKE_ARGS} \
	-DCMAKE_BUILD_TYPE:STRING=Release \
	-DBUILD_TESTS:BOOL=TRUE \
	-DEXTERNAL_PICOJSON:BOOL=TRUE \
;

# build
cmake --build . --verbose --parallel ${CPU_COUNT}

# test
if [[ "${CONDA_BUILD_CROSS_COMPILATION}" != "1" ]]; then
./tests/jwt-cpp-test
fi

# install
cmake --build . --verbose --parallel ${CPU_COUNT} --target install
