#!/bin/bash
hw_n=$(pwd -P | tail -2c)
executable=$(ls -l | grep  '\-..x' | egrep -o '[a-zA-Z0-9]+$')
/c/cs223/bin/testit $hw_n $executable
