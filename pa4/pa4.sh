#!/bin/bash
# cse101-pt.w22 grading
# usage: pa4.sh
# (run within your pa4 directory to test your code)

SRCDIR=https://raw.githubusercontent.com/gecko10000/cse101-pt.w22/main/pa4

EXE_ALL=( pa4-func-check.sh pa4-lunit-check.sh pa4-munit-check.sh pa4-make-check.sh )
EXE_RANGE=$((${#EXE_ALL[*]} - 1))
echo $EXE_RANGE
for i in $(seq 0 $EXE_RANGE); do
  curl $SRCDIR/${EXE_ALL[i]} > ${EXE_ALL[i]}
  chmod +x ${EXE_ALL[i]}
  ./${EXE_ALL[i]}
  rm -f ${EXE_ALL[i]}
done
