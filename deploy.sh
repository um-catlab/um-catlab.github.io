#!/usr/bin/env sh

./build.sh

git add .

echo $(date -I) | git commit --file -

git push origin master
