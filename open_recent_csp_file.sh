#!/bin/bash

dir_path="YOUR CLIP STUDIO PAINT FILE DIR PATH"
array=`find "$dir_path" -name "*.clip" -print0 -o -name "*.cmc" -print0 | xargs -0 ls -t  | head -1`
if [ ${#array[*]}  -eq 1 ]; then
    open "${array[0]}"
fi
