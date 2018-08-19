#!/bin/sh

#converts all files in current directory from JPEG to PNG
#by Bright Geng 19/8/18

#set -x
for file in *
do  
    if test `echo "$file"| egrep '.jpg'| wc -l ` -eq 0
    then
       # echo $file is not a JPG
        continue
    fi
    newName=`echo "$file" | sed 's/.jpg/.png/g'`
    if test -r "$newName"
    then
        echo $newName already exists
        exit 1
    fi
    convert "$file" "$newName"
    if test "$?" -eq 0
    then
       #echo "$file" became "$newName"
        rm "$file"
    fi
done
