#!/bin/bash

ISL_ROOT="$(dirname "$0")"
cd "$ISL_ROOT"

git submodule update --init --recursive

if [ ! -e "./isl_config.h" ]; then
    autoreconf -i
    ./configure --with-clang=system --with-int=imath
fi

if [ ! -e "./gitversion.h" ]; then
  make gitversion.h
fi

make "$@" libisl.la interface/isl.py
