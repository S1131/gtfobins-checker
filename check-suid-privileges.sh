#!/bin/bash


list=$(find / -perm -u=s -type f 2>/dev/null)

for file in $(cat suid-commands.list)
do
    command=$(echo -e "$list" | grep -e "/$file$")
    if [ -n "$command" ]; then
        echo "$command"
        echo -e "============================================================================="
        cat ./suid/$file | sed 's/\*\*\*\*\* SUID \*\*\*\*\*//' | sed 's/\*\*\*\*\* //'
        echo -e "\n"
    fi
done