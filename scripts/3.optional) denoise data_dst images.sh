#!/usr/bin/env bash
source env.sh

$DFL_PYTHON "$DFL_SRC/main.py" videoed denoise-image-sequence \
    --input-file "$DFL_WORKSPACE/data_dst" 