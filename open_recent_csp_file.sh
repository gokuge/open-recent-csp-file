#!/bin/bash

dir_path="YOUR CLIP STUDIO PAINT FILE DIR PATH"
clipArray=`find "$dir_path" -name "*.clip" -print0 | xargs -0 ls -t  | head -1`

# clipArrayが空文字の場合は.clipファイルが存在しないとみなす
if [ -z "${clipArray[0]}" ]; then
    return
fi

# 最新の.clipが取れた。同階層に.cmcがあるか調べる
dir=$(dirname "${clipArray[0]}")
cmcArray=`find "$dir" -name "*.cmc" -maxdepth 1 -print0 | xargs -0 ls -t  | head -1`

if [ -n "${cmcArray[0]}" ]; then
	# .clipが最新だが同階層に.cmcがある。.cmcを開く
	open "${cmcArray[0]}"
else
	# .clipが最新で同階層に.cmcはない。.clipを開く
	open "${clipArray[0]}"
fi
