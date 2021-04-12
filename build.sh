#!/bin/bash

ISL_ROOT="$(dirname "$0")"

if [ ! -e "$ISL_ROOT/.libs/libisl.so" ]; then (
    echo "Build libisl.so"
    cd "$ISL_ROOT"
    autoreconf -i
    ./configure --with-clang=system
    make $@
) fi

if [ ! -e "$ISL_ROOT/interface/isl.py" ]; then (
    echo "Build isl.py"
    cd "$ISL_ROOT"
    make $@ interface/isl.py
) fi

ln -sf $(realpath $ISL_ROOT/interface/isl.py) $ISL_ROOT/isl.py
ln -sf $(realpath $ISL_ROOT/.libs/libisl.so) $ISL_ROOT/libisl.so
