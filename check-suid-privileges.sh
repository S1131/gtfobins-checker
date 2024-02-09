#!/bin/bash

list=$(find / -perm -u=s -type f 2>/dev/null)

echo -e "\n\n  SUID Privileged binaries\n\n"

for command in $list
do
    bin=$(echo "$command" | awk -F '/' '{print $NF}')
    exists=$(grep "$bin" suid-commands.list)
    if [ -n "$exists" ]; then
        echo -e "$command\n============================================================================="
        cat "suid/$bin"
        echo -e "\n"
    fi
done