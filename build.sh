#!/usr/bin/env sh

./cleanup.sh

git submodule update --remote

cd forest

./build.sh

cd ..

cp -r forest/output/* .

