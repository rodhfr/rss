#!/bin/bash

# Get the folder where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

repo_path="${1:-$SCRIPT_DIR}"

if [[ ! -d "$repo_path/.git" ]]; then
    echo "❌ '$repo_path' is not a git repository."
    exit 1
fi

cd "$repo_path" || exit 1

echo "📂 Working in: $repo_path"

# Check if there's anything to commit
if git diff --quiet && git diff --cached --quiet; then
    echo "✅ No changes to commit."
    exit 0
fi

timestamp=$(date +"%Y-%m-%d %H:%M:%S")
commit_msg="manual commit at $timestamp"

git add .
git commit -m "$commit_msg"
git push

echo "🚀 Changes pushed successfully!"

