#!/bin/bash
set -e

ccache_default_dir=$(ccache -s | head -n 1 | rev | cut -d ' ' -f1 | rev)
suffix=$(lscpu | sed -nr '/Model name/ s/.*:\s*(.*)/\1/p' | sed -e 's/[^A-Za-z0-9._-]/_/g')

export CCACHE_DIR=${ccache_default_dir}/${suffix}

mkdir -p $CCACHE_DIR

exec "$@"
