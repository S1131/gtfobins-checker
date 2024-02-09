# gtfobins-checker

Privileges checker thx to GTFOBins Project
`https://gtfobins.github.io/`


## Usage

Download repository
```
git clone https://github.com/f10j0/gtfobins-checker.git
```

Verify sudo privileges
```
sh check-sudo-privileges.sh
```

Verify suid privileges
```
sh check-suid-privileges.sh
```

Verify capabilities privileges
```
sh check-caps-privileges.sh
```

## Update Payloads and commad list


Install dependency
```
sudo apt install -y html2text curl
```

Update 'SUID' from gtfobins
```
sh update/suid.sh
```

Update 'Sudo' from gtfobins
```
sh update/sudo.sh
```

Update 'Capabilities' from gtfobins
```
sh update/capabilities.sh
```
