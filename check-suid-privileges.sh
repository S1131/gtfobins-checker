#!/bin/bash


list=$(find / -perm -u=s -type f 2>/dev/null)

echo "\n"
echo " > find / -perm -u=s -type f 2>/dev/null\n\n"
echo "$list"
echo "\n\n\n"

for command in $list
do
    bin=$(echo "$command" | awk -F '/' '{print $NF}')
    exists=$(egrep -e "^$bin$" ./data/suid-commands.list)
    if [ -n "$exists" ]; then
        echo "\n > $command"
        cat "./data/suid/$bin"
        echo "\n"
    fi
done