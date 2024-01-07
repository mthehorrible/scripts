#!/usr/bin/python3

from datetime import datetime

# Set colors
RED = '\033[0;31m'
GREEN = '\033[0;32m'
NC = '\033[0m' # No Color

# Get the current day of the week
DAY=datetime.now().strftime('%A')

# Check if the day of the week matches then display message
if DAY == "Wednesday":
    print("")
    print(f"{GREEN}It is {DAY},         ")
    print(f"{GREEN}   (o)____(o)        ")
    print(f"{GREEN} _/          \_      ")
    print(f"{GREEN}/ \----------/ \     ")
    print(f"{GREEN}\   | |  | |   /     ")
    print(f"{GREEN}          my dudes{NC}")
    print("")
else:
    print(f"\n{RED}No, it is {DAY}{NC}\n")
