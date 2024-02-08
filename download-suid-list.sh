#!/bin/bash


# Download SUID command list to: suid-command.list
curl -s https://gtfobins.github.io | grep "#suid" | awk -F '"' '{print $2}' | awk -F '/' '{print $3}' > suid-commands.list