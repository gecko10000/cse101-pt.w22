#!/bin/bash
# cse101-pt.w22
# usage: pa7.sh
# (run within your pa7 directory to test your code)

SRCDIR=https://raw.githubusercontent.com/gecko10000/cse101-pt.w22/main/pa7

EXE_ALL=( pa7-func-check.sh pa7-unit-check.sh pa7-make-check.sh )
EXE_RANGE=$((${#EXE_ALL[*]} - 1))
echo $EXE_RANGE
for i in $(seq 0 $EXE_RANGE); do
  curl $SRCDIR/${EXE_ALL[i]} > ${EXE_ALL[i]}
  chmod +x ${EXE_ALL[i]}
  ./${EXE_ALL[i]}
  rm -f ${EXE_ALL[i]}
done
