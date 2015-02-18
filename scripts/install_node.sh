#!/usr/bin/env bash

MASON_PLATFORM= mason install node 0.10.35
export PATH="`mason prefix node 0.10.35`/bin":"$PATH"
