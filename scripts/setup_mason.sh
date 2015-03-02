#!/usr/bin/env bash

git submodule update --init .mason
export PATH=`pwd`/.mason:$PATH
export MASON_DIR=`pwd`/.mason
