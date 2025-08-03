#!/bin/sh
for f in /home/mandrock0/.bash_*; do
if [ -f "$f" ]; then
  if [ "$(basename "$f")" != ".bash_history" ]; then
    source "$f"
  fi
fi
done
