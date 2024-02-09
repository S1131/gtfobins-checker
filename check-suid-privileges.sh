#!/bin/bash

list=$(find / -perm -u=s -type f 2>/dev/null)

for command in $list
do
    bin=$(echo "$command" | awk -F '/' '{print $NF}')
    exists=$(grep "$bin" suid-commands.list)
    if [ -n "$exists" ]; then
        echo "$exists"
        echo -e "$command\n============================================================================="
        cat "suid/$bin"
    fi
done