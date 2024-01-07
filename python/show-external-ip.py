#!/usr/bin/python3

import requests     # Used for getting external IP

# Set colors
CYAN = '\033[0;36m'
MAGENTA = '\033[1;35m'

extIp = requests.get('https://checkip.amazonaws.com').text.strip()

print(f"\n{MAGENTA}External IP: {CYAN}{extIp}\n")
