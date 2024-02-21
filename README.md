# gtfobins-checker

Privileges checker thx to GTFOBins Project
`https://gtfobins.github.io/`

## Description

Checks privileges escalation for sudo, suid, capabilities and shows escalation help.

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

## Disclaimer

Any action or activity related to the material contained in these tools is your sole responsibility. The author will not be responsible if criminal charges are brought against anyone who misuses the tools in this repository to violate the law.