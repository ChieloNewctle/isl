#!/bin/bash

ISL_ROOT="$(dirname "$0")"
echo "$ISL_ROOT"

if [ ! -e "$ISL_ROOT/.libs/libisl.so" ]; then (
    echo "Build libisl.so"
    cd "$ISL_ROOT"
    autoreconf -i
    ./configure --with-clang=system
    make -j4
) fi

if [ ! -e "$ISL_ROOT/interface/isl.py" ]; then (
    echo "Build isl.py"
    cd "$ISL_ROOT"
    make -j4 interface/isl.py
) fi

ln -sf $(realpath $0/interface/isl.py)
ln -sf $(realpath $0/.libs/libisl.so)
