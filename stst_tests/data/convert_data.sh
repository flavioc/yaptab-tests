#!/bin/sh

for file in $(ls *.pl); do
  echo $file
  sed -e 's:edge(\([0-9]*\),\([0-9]*\)):edge(f(\1),f(\2)):g' $file > ${file}x
  rm -f $file
  mv ${file}x $file
done
