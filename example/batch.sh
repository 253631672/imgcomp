#!/usr/bin/env bash
# imgcomp 批量压图示例：把当前目录下所有 jpg/png 缩到最长边1600、体积压到300KB以内
# 用法：把本文件和 imgcomp.py 放同一目录，然后 bash batch.sh <图片目录>

set -e
DIR="${1:-.}"
OUT="${DIR}/compressed"
mkdir -p "$OUT"

count=0
for f in "$DIR"/*.jpg "$DIR"/*.jpeg "$DIR"/*.png; do
  [ -e "$f" ] || continue
  name=$(basename "$f")
  python3 imgcomp.py "$f" "$OUT/$name" --max-side 1600 --max-kb 300
  count=$((count+1))
done

echo "完成：$count 张，输出在 $OUT"
