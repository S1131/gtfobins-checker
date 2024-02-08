# gtfobins-checker

Easy Checker Privileges thx to GTFOBins Project
`https://gtfobins.github.io/`


## Install
```
# Install dependency
sudo apt install html2text
# Clone repository
git clone https://github.com/f10j0/gtfobins-checker.git
```

## Usage

Verify sudo privileges
```
./check-sudo-privileges.sh
```

Verify suid privileges
```
./check-suid-privileges.sh
```

## Update Payloads and commad list

 Update 'SUID' commands list from gtfobins
```
./download-suid-list.sh
```

Update 'Sudo' command list from gtfobins
```
./download-sudo-list.sh
```

Update suid payloads list from gtfobins
```
./download-suid-payloads.sh
```

Update sudo payloads list from gtfobins
```
./download-sudo-payloads.sh
```
