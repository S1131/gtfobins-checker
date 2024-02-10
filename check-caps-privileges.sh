#!/bin/bash


list=$(getcap -r / 2>/dev/null)

echo  "\n"
echo  " > getcap -r / 2>/dev/null\n\n"
echo  "$list"
echo  "\n"

echo "$list" | while IFS= read -r line;
do
    # Fix for binary with extensions
    bin=$(echo "$line" | awk '{print $1}' | awk -F '/' '{print $NF}' | awk -F '.' '{print $1}')
    setuid=$(echo "$line" | grep "cap_setuid")
    exists=$(egrep -s -e "^$bin$" ./data/caps-commands.list)
    if [ -n "$exists" ] && [ -n "$setuid" ]; then
        echo  "\n > $line"
        cat "./data/caps/$bin"
        echo  "\n"
    fi
done