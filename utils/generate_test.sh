#!/bin/bash

TEMPLATE=$1
DATA=$2
DO=$3

TEST_NAME=`basename $TEMPLATE .tpl`
SIZES="16 32 64 512 1024 2048 4096 8192 16384 32768"

for size in $SIZES; do
  file="test_${TEST_NAME}_${DATA}_${size}.pl"
  datafile="data/${DATA}_${size}.pl"
  if [ -f "$datafile" ]; then
    echo $file
    if [ ! -z "$DO" ]; then
      sed -e "s/SIZE/${size}/" -e "s/DATA/${DATA}/" $TEMPLATE > $file
    fi
  fi
done
