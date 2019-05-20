#!/bin/bash

if [ $# -eq 0 ]
then
    echo "Must supply file name argument"
fi

input=$1

notify_mayhem () {
    kill -6 $$
}

while IFS= read -r line
do
    echo "$line"
    if [ $line == "secret" ]; then
        notify_mayhem
    fi

done < "$input"
