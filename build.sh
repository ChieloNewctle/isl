#!/bin/bash

ISL_ROOT="$(dirname "$0")"
cd "$ISL_ROOT"

if [ ! -e "./configure" ]; then (
    autoreconf -i
    ./configure --with-clang=system --with-int=imath
) fi

make $@ all interface/isl.py

ln -sf $(realpath $ISL_ROOT/interface/isl.py) $ISL_ROOT/isl.py
ln -sf $(realpath $ISL_ROOT/.libs/libisl.so) $ISL_ROOT/libisl.so
