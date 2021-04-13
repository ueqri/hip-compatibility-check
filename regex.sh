#!/bin/bash

SOURCE_DIR=~/repo/pcl/  # change this to your own path
CUDA2HIP_FILE=cuda2hip.md
MATCHER_LIST=matcher-lists.txt

echo -n "" > $MATCHER_LIST

while read -r LINE
do
  LINE_C=${LINE// /} # get compact line string without whitespace
  HIP_API=`echo $LINE_C | cut -d "|" -f6`
  if [ -z "$HIP_API" ]; then
    CUDA_API=`echo $LINE_C | cut -d "|" -f2`
    echo ${CUDA_API//\`/} >> $MATCHER_LIST
  fi
done < $CUDA2HIP_FILE

find "$SOURCE_DIR" -type f \( -name "*.c" -o -name "*.cpp" -o -name "*.cu" -o -name "*.h" -o -name "*.hpp" \) | \
xargs grep -f $MATCHER_LIST