#!/bin/bash
#
# https://github.com/txthinking/pac
#

for s
do
    if [ $(grep -e "^$s$" ./white_cidr.list | wc -l) -gt 0 ]
    then
        echo "Exists: $s"
    else
        echo "$s" >> ./white_cidr.list
        sort -u -t. -k 1,1n -k 2,2n -k 3,3n -k 4,4n ./white_cidr.list -o ./white_cidr.list
        echo "Added: $s"
    fi
done

