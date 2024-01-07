#!/usr/bin/python3

import datetime     # Used convert uptime from seconds
import platform     # Used for getting OS and kernel
import requests     # Used for getting external IP
import socket       # Used for getting hostname and internal IP

# Set colors
CYAN = '\033[0;36m'
MAGENTA = '\033[1;35m'
NC = '\033[0m' # No Color

hostname = socket.gethostname()
intIp = socket.gethostbyname(hostname)
extIp = requests.get('https://checkip.amazonaws.com').text.strip()
uname = platform.uname()


def uptime():  
    with open('/proc/uptime', 'r') as f:
        up_sec = float(f.readline().split()[0])
        return int(up_sec)


print("")
print(f"{MAGENTA}Hostname:    {CYAN}{hostname}{NC}")
print(f"{MAGENTA}OS:          {CYAN}{uname.system}{NC}")
print(f"{MAGENTA}Kernel:      {CYAN}{uname.release}{NC}")
print(f"{MAGENTA}Uptime:      {CYAN}{str(datetime.timedelta(seconds=uptime()))}{NC}")
print(f"{MAGENTA}Internal IP: {CYAN}{intIp}{NC}")
print(f"{MAGENTA}External IP: {CYAN}{extIp}{NC}")
print("")
