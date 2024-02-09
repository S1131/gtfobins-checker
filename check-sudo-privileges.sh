#!/bin/bash

read_all_sudo() {

    for command in $(cat sudo-commands.list)
    do
        exists=$(which $command | grep -e "/$command$")
        if [ -n "$exists" ]; then
            echo -e "============================================================================="
            cat ./sudo/$command
            echo -e "\n"
        fi
    done
}

read_nopass_commands() {
    commands=$(echo $1 | sed 's/,//')
    for command in $commands 
    do  
        bin=$(echo "$command" | awk -F '/' '{print $NF}')
        if [[ -f "./sudo/$bin" ]]; then
            echo -e "$command\n============================================================================="
            cat "./sudo/$bin"
            echo -e "\n"
        fi
    done
}

echo -e "\n\n  Sudo Privileged binaries\n\n"

sudo_file=$(sudo -l)
echo -e "$sudo_file" | while IFS= read -r line;
do
    if echo $line | grep -q -E 'User ([a-z_]+) may run the following commands on ([a-z_]+):'; then                
        user=$(echo $line | awk '{print $2}')
        IFS= read -r line
        while echo "$line" | grep -q '^    '
        do            
            if echo $line | grep -q -e "NOPASSWD:" ;then

                commands=$(echo $line | awk -F 'NOPASSWD:' '{print $2}')
                read_nopass_commands "$commands"

            fi
            #if [[ "$line" == "    (ALL : ALL) ALL" ]]; then
            #    echo -e "User: $user can elevate privileges with:\n"
            #    read_all_sudo
            #    echo ""
            #fi
            IFS= read -r line
        done
    fi
done