#!/bin/bash
hw_n=$(pwd -P | tail -2c)
executable=$(ls -l | grep  '\-..x' | egrep -o '[a-zA-Z0-9]+$')
#number=$(seq -f "%02g" $1)
number=$1
# FIXME: Check the argument, make sure that it is a double-digit integer always
testcase="/c/cs223/Hwk$hw_n/Tests/t$number.c"
echo $testcase
solution="${testcase}s"
./$executable < $testcase
printf "\nDiff: \n"
./$executable < $testcase | cmp - $solution
./$executable < $testcase | diff - $solution

