#!/bin/bash


# Download/Update "Capabilities" commands list
curl -s https://gtfobins.github.io | grep "#capabilities" | awk -F '"' '{print $2}' | awk -F '/' '{print $3}' > ./data/caps-commands.list

# Download/Update "Capabilities" commands help
for command in $(cat ./data/caps-commands.list)
do
    curl --location -s https://gtfobins.github.io/gtfobins/$command | html2text | grep -Pzo '((?s)(\*\*\*\*\* Capabilities \*\*\*\*\*)(.*)(\*\*\*\*\* ))|(?s)(\*\*\*\*\* Capabilities \*\*\*\*\*)(.*)' | sed 's/\*\*\*\*\* Capabilities \*\*\*\*\*//' | sed 's/\*\*\*\*\*//' > ./data/caps/$command
    echo "Downloaded ./data/caps/$command"
done