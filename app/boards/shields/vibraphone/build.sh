#!/usr/bin/env bash

# cd to ./app
cd ../../../

if [ "$ZEPHYR_BASE" == "" ]; then
  pushd ../zephyr
  source zephyr-env.sh
  popd
fi

west build -d build/left -b nice_nano_v2 -- -DSHIELD=vibraphone_left
