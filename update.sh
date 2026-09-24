#!/usr/bin/env bash
set -e
cd "$(dirname "$0")"
f="$(ls -t ~/Downloads/metro-wire-demo-index-html*.txt 2>/dev/null | head -1)"
[ -n "$f" ] || { echo "Download the new build first."; exit 1; }
cp "$f" index.html
git add -A
git commit -m "demo update $(date +%F_%H%M)" || { echo "Already up to date."; exit 0; }
git push
echo "Pushed. Give GitHub Pages a minute."
