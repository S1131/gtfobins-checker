#!/bin/bash


# Update suid help
for command in $(cat ./suid-commands.list)
do
    echo "Downloading suid/$command"
    curl --location -s https://gtfobins.github.io/gtfobins/$command | html2text | grep -Pzo '((?s)(\*\*\*\*\* SUID \*\*\*\*\*)(.*)(\*\*\*\*\* ))|(?s)(\*\*\*\*\* SUID \*\*\*\*\*)(.*)' | sed 's/\*\*\*\*\* SUID \*\*\*\*\*//' | sed 's/\*\*\*\*\* //' > suid/$command
done
