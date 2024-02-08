#!/bin/bash


list=$(find / -perm -u=s -type f 2>/dev/null)

for file in $(cat sudo-commands.list)
do
    command=$(echo -e "$list" | grep -e "/$file$")
    if [ -n "$command" ]; then
        echo "$command"
        echo -e "============================================================================="
        cat ./sudo/$file | sed 's/\*\*\*\*\* Sudo \*\*\*\*\*//' | sed 's/\*\*\*\*\* //'
        echo -e "\n"
    fi
done