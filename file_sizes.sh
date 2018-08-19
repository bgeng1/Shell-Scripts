#!/bin/sh

#organises files in the current directory into categories based on size i.e lines

#files=`ls`
files=`find . -maxdepth 1 -type f | cut -c3- |sort`
printf "Small files:"
for file in $files
do
    lines=`wc -l $file|cut -d' ' -f1`
    if test $lines -lt 10
    then
        printf " $file"
    fi
done
printf "\n"

printf "Medium-sized files:"
for file in $files
do
    lines=`wc -l $file|cut -d' ' -f1`
    if test $lines -lt 100 -a $lines -ge 10
    then
        printf " $file"
    fi
done
printf "\n"

printf "Large files:"
for file in $files
do
    lines=`wc -l $file|cut -d' ' -f1`
    if test $lines -ge 100
    then
        printf " $file"
    fi
done
printf "\n"
