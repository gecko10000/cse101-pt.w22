#!/usr/bin/bash

SRCDIR=https://raw.githubusercontent.com/agavgavi/cse101-pt.w22/master/pa2

echo ""
echo ""

rm -f *.o FindPath

make

if [ ! -e FindPath ] || [ ! -x FindPath ]; then # exist and executable
  echo ""
  echo "WARNING: Makefile probably doesn't correctly create Executable!!!"
  echo ""
else
  echo ""
  echo "Makefile probably correctly creates Executable!"
  echo ""
fi

echo ""
echo ""

make clean

if [ -e FindPath ] || [ -e *.o ]; then
  echo "WARNING: Makefile didn't successfully clean all files"
fi

rm -f *.o FindPath garbage

