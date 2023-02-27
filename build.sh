#!/bin/bash

ISL_ROOT="$(dirname "$0")"
cd "$ISL_ROOT"

if [ ! -e "./isl_config.h" ]; then
    autoreconf -i
    ./configure --with-clang=system --with-int=imath
fi

make "$@" libisl.la interface/isl.py
