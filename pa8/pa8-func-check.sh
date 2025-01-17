#!/usr/bin/bash

SRCDIR=https://raw.githubusercontent.com/gecko10000/cse101-pt.w22/main/pa8
NUMTESTS=5
PNTSPERTEST=3
let MAXPTS=$NUMTESTS*$PNTSPERTEST

if [ ! -e backup ]; then
   echo "WARNING: a backup has been created for you in the \"backup\" folder"
   mkdir backup
fi


cp *.cpp *.h Makefile backup   # copy all files of importance into backup

for NUM in $(seq 1 $NUMTESTS); do
   curl $SRCDIR/infile$NUM.txt > infile$NUM.txt
   curl $SRCDIR/model-outfile$NUM.txt > model-outfile$NUM.txt
done

echo ""
echo ""

g++ -std=c++17 -Wall -c -g Order.cpp Dictionary.cpp
g++ -std=c++17 -Wall -o Order Order.o Dictionary.o

ordertestspassed=$(expr 0)
echo "Please be warned that the following tests discard all output to stdout while reserving stderr for valgrind output"
echo "Press enter to continue"
read verbose
for NUM in $(seq 1 $NUMTESTS); do
  rm -f outfile$NUM.txt
  echo "Order Test $NUM: (Press enter to continue...)"
  echo "Please check the diff$NUM.txt files manually if you fail the cases"
  read verbose
  timeout 15 valgrind --leak-check=full -v ./Order infile$NUM.txt outfile$NUM.txt &> valgrind-out$NUM.txt
  diff -bBwu --speed-large-files outfile$NUM.txt model-outfile$NUM.txt &> diff$NUM.txt >> diff$NUM.txt
  echo "=========="
  if [ -e diff$NUM.txt ] && [[ ! -s diff$NUM.txt ]]; then
    echo "PASS case"
  else
    echo "FAIL"
  fi
  echo "=========="
  if [ -e diff$NUM.txt ] && [[ ! -s diff$NUM.txt ]]; then
    let ordertestspassed+=1
  fi
done

let ordertestpoints=${PNTSPERTEST}*ordertestspassed

echo "Passed $ordertestspassed / $NUMTESTS Order tests"
echo "This gives a total of $ordertestpoints / $MAXPTS points"
echo ""
echo ""

echo "Press Enter To Continue with Valgrind Results for Order"
#TODO find a way to automate detecting if leaks and errors are found and how many
read garbage

for NUM in $(seq 1 $NUMTESTS); do
   echo "Order Valgrind Test $NUM: (Press enter to continue...)"
   read verbose
   echo "=========="
   cat valgrind-out$NUM.txt
   echo "=========="
done

echo ""
echo ""
rm -f *.o Order valgrind-out*

