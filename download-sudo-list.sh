#!/bin/bash


# Download SUID command list to: suid-command.list
curl -s https://gtfobins.github.io | grep "#sudo" | awk -F '"' '{print $2}' | awk -F '/' '{print $3}' > sudo-commands.list