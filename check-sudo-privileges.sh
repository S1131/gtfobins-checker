#!/bin/bash


read_nopass_all() {

    for bin in $(cat ./data/sudo-commands.list)
    do
        path=$(which $bin)
        exists=$(echo "$path" | grep -e "/$bin$")
        if [ -n "$exists" ]; then
            echo " > $path"
            cat ./data/sudo/$bin
            echo "\n"
        fi
    done
}

read_nopass_commands() {
    commands=$(echo $1 | sed 's/,//')
    for command in $commands 
    do  
        bin=$(echo "$command" | awk -F '/' '{print $NF}')
        if [ -f "./data/sudo/$bin" ]; then
            echo " > $command"
            cat "./data/sudo/$bin"
            echo "\n"
        fi
    done
}

sudo_file=$(sudo -l)

echo "\n"
echo " > sudo -l \n\n"
echo "$sudo_file"
echo "\n\n\n"


echo "$sudo_file" | while IFS= read -r line;
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
            if echo $line | grep -q -e "NOPASSWD: ALL" ;then

                read_nopass_all

            fi
            IFS= read -r line
        done
    fi
done