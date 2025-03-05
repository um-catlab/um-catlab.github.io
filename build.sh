#!/usr/bin/env sh

./cleanup.sh

cd forest

./build.sh

cd ..

cp -r forest/output/* .

