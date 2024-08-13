#!/usr/bin/env bash
set -o errexit
set -o nounset
set -o pipefail
IFS=$'\n\t'

new_tag=`next_git_version`
current_branch=`git rev-parse --abbrev-ref HEAD`
current_tag=`git tag | sort --reverse | head --lines 1`
git add .
git commit -m "quick commit"
git checkout main
git merge "${current_branch}" 
git push origin --all
git tag -a "${new_tag}" -m "${new_tag}"
git push origin --tags
git checkout "${current_branch}"
echo "New version: $new_tag"
