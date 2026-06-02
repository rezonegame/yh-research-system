#!/bin/bash
# sync.sh - 一键同步 skills 到 GitHub
# 用法: bash sync.sh "更新说明"

cd "$(dirname "$0")"

MSG=${1:-"sync: update skills $(date +%Y-%m-%d)"}

git add -A
git commit -m "$MSG"
git push

echo ""
echo "✅ 已同步到 https://github.com/rezonegame/yh-research-system"
