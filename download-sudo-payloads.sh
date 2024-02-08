#!/bin/bash


# Update sudo help
for command in $(cat ./sudo-commands.list)
do
    echo "Downloading sudo/$command"
    curl --location -s https://gtfobins.github.io/gtfobins/$command | html2text | grep -Pzo '((?s)(\*\*\*\*\* Sudo \*\*\*\*\*)(.*)(\*\*\*\*\* ))|(?s)(\*\*\*\*\* Sudo \*\*\*\*\*)(.*)' > sudo/$command
done
