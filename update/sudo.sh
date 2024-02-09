#!/bin/bash


# Download/Update "sudo" commands list
curl -s https://gtfobins.github.io | grep "#sudo" | awk -F '"' '{print $2}' | awk -F '/' '{print $3}' > ./data/sudo-commands.list

# Download/Update "sudo" commands help
for command in $(cat ./data/sudo-commands.list)
do
    curl --location -s https://gtfobins.github.io/gtfobins/$command | html2text | grep -Pzo '((?s)(\*\*\*\*\* Sudo \*\*\*\*\*)(.*)(\*\*\*\*\* ))|(?s)(\*\*\*\*\* Sudo \*\*\*\*\*)(.*)' | sed 's/\*\*\*\*\* Sudo \*\*\*\*\*//' | sed 's/\*\*\*\*\*//' > ./data/sudo/$command
    echo "Downloaded ./data/sudo/$command"
done
