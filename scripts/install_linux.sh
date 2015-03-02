#!/usr/bin/env bash

set -e
set -o pipefail

mapbox_time "install_mesa" mason install mesa 10.4.3
export LD_LIBRARY_PATH=`mason prefix mesa 10.4.3`/lib

# Set the core file limit to unlimited so a core file is generated upon crash
ulimit -c unlimited -S
