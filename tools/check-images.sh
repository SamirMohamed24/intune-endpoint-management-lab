#!/usr/bin/env bash
# Lists screenshots referenced in docs/ that are not in docs/images yet.
# Missing images are reported as warnings so the build stays green while screenshots are added.
set -uo pipefail
missing=0
for f in docs/*.md; do
  grep -o '](images/[^)]*)' "$f" | sed 's#](\(.*\))#\1#' | while read -r img; do
    if [ ! -f "docs/$img" ]; then
      echo "::warning file=$f::Missing screenshot docs/$img"
    fi
  done
done
total=$(grep -oh '](images/[^)]*)' docs/*.md | sort -u | wc -l)
present=$(grep -oh '](images/[^)]*)' docs/*.md | sort -u | sed 's#](\(.*\))#docs/\1#' | xargs -I{} sh -c 'test -f {} && echo ok' | wc -l)
echo "Screenshots: ${present}/${total} present"
