#!/bin/bash


# Download/Update "SUID" commands list
curl -s https://gtfobins.github.io | grep "#suid" | awk -F '"' '{print $2}' | awk -F '/' '{print $3}' > ./data/suid-commands.list

# Download/Update "SUID" commands help
for command in $(cat ./data/suid-commands.list)
do
    curl --location -s https://gtfobins.github.io/gtfobins/$command | html2text | grep -Pzo '((?s)(\*\*\*\*\* SUID \*\*\*\*\*)(.*)(\*\*\*\*\* ))|(?s)(\*\*\*\*\* SUID \*\*\*\*\*)(.*)' | sed 's/\*\*\*\*\* SUID \*\*\*\*\*//' | sed 's/\*\*\*\*\* //' > ./data/suid/$command
    echo "Downloaded ./data/suid/$command"
done
