#!/usr/bin/env bash
set -e

# pushd to ./app
pushd ../../../

if [ "$ZEPHYR_BASE" == "" ]; then
  source ../zephyr/zephyr-env.sh
fi

west build -d build/left -b nice_nano_v2 -- -DSHIELD=vibraphone_left

popd

MOUNT_POINT="/Volumes/NICENANO"
until [ -d "$MOUNT_POINT" ]
do
  sleep 1
  echo "Waiting for $MOUNT_POINT to be mounted..."
done

cp ../../../../app/build/left/zephyr/zmk.uf2 "$MOUNT_POINT"

echo "Done flashing!"
