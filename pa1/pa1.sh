#!/bin/bash
# cse101-pt.w22
# usage: pa1.sh
# (run within your pa1 directory to test your code)

SRCDIR=https://raw.githubusercontent.com/gecko10000/cse101-pt.w22/main/pa1

EXE_ALL=( pa1-func-check.sh pa1-unit-check.sh pa1-make-check.sh )
EXE_RANGE=$((${#EXE_ALL[*]} - 1))
echo $EXE_RANGE
for i in $(seq 0 $EXE_RANGE); do
  curl $SRCDIR/${EXE_ALL[i]} > ${EXE_ALL[i]}
  chmod +x ${EXE_ALL[i]}
  ./${EXE_ALL[i]}
  rm -f ${EXE_ALL[i]}
done
