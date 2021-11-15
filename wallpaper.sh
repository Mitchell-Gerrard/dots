#!/bin/env bash
trap "exit" INT
while :
do
start=$SECONDS
arr=($( ls -p ~/gifs | grep -v / ))
arr1=(~/Pictures/*)
giflen=${#arr[@]}
piclen=${#arr1[@]}
totval=`expr ${#arr[@]}+${#arr1[@]}`
number=$(( RANDOM % totval ))
if [ $number -ge $giflen ]
then
feh --bg-tile --randomize /home/mitchyman/Pictures/*
sleep 120
else
hash=`md5sum ~/gifs/${arr[$number]} | cut -f1 -d" "`
echo $number
echo ${arr[$number]}
if [ -d "$HOME/gifs/temp/$hash" ] 
then
    echo "gif exists exists." 
else
    echo "Error: Directory /path/to/dir does not exists."
    mkdir ~/gifs/temp/$hash
    convert -coalesce ~/gifs/${arr[$number]}  ~/gifs/temp/$hash/$hash.png
fi
duration=$(( SECONDS - start ))
c=0
slep=0.5
while [[ $c -lt 12 ]]
do for i in $(ls ~/gifs/temp/$hash -v)
do feh --bg-tile --no-fehbg ~/gifs/temp/$hash/$i
sleep 0.1
done
(( c++ ))
echo $c
done
fi
done
