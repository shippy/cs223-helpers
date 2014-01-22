#!/bin/bash
hw_n=$(pwd -P | tail -2c) # Last char of current directory; assumed to be of form "Hwk2" or equivalent
executable=$(ls -l | grep  '\-..x' | egrep -o '[a-zA-Z0-9]+$') # Assuming exactly one executable in folder, and assuming its name matches assignment name
testcase=$1 # Assuming the test file is given as a command=line argument
solution="/c/cs223/Hwk1/test.Csquash < $testcase"

#echo "My file outputs:"
#./$executable < $testcase
#echo "* * * *"
#echo "Stan's file outputs:"
#/c/cs223/Hwk1/Csquash < $testcase 

#tmpfile="/tmp/res.txt"
#./$executable < $testcase > $tmpfile
#/c/cs223/Hwk1/Csquash < $testcase | cmp - $tmpfile


diff <(./$executable < $testcase) <(/c/cs223/Hwk1/Csquash < "$testcase")
cmp <(./$executable < $testcase) <(/c/cs223/Hwk1/Csquash < "$testcase")
#./$executable < $testcase | diff - `$solution`
