#!/bin/bash
arr1=(~/Pictures/*)
numby=$(($RANDOM % ${#arr1[@]}))
echo ${arr1[$numby]}
echo $numby
echo ${#arr1[@]}
