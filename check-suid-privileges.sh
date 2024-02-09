#!/bin/bash

list=$(find / -perm -u=s -type f 2>/dev/null)

echo -e "\n"
echo -e " > find / -perm -u=s -type f 2>/dev/null\n\n"
echo -e "$list"
echo -e "\n\n\n"

for command in $list
do
    bin=$(echo "$command" | awk -F '/' '{print $NF}')
    exists=$(grep "$bin" suid-commands.list)
    if [ -n "$exists" ]; then
        echo -e "\n > $command"
        cat "suid/$bin"
        echo -e "\n"
    fi
done


