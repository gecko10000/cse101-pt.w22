#!/bin/bash
# cse101-pt.w22
# usage: pa5.sh
# (run within your pa5 directory to test your code)

SRCDIR=https://raw.githubusercontent.com/gecko10000/cse101-pt.w22/main/pa5

EXE_ALL=( pa5-func-check.sh pa5-unit-check.sh pa5-make-check.sh )
EXE_RANGE=$((${#EXE_ALL[*]} - 1))
echo $EXE_RANGE
for i in $(seq 0 $EXE_RANGE); do
  curl $SRCDIR/${EXE_ALL[i]} > ${EXE_ALL[i]}
  chmod +x ${EXE_ALL[i]}
  ./${EXE_ALL[i]}
  rm -f ${EXE_ALL[i]}
done
