#!/bin/bash

cd "$(dirname "$0")"

autoreconf -i
./configure --with-clang=system
make -j4
make interface/isl.py

ln -sf interface/isl.py
ln -sf .libs/libisl.so
