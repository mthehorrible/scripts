#!/bin/bash

# Set number of days to check
dayCount="30"

# Calculate the timestamp
dayLimit=$(date -d "$dayCount days ago" +%s)

# Get timestamp of the last update
lastUpdate=$(dnf history list | grep update | head -n 1 | awk '{print $4, $5}' | date -f - +%s 2>/dev/null)

# Set colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
MAGENTA='\033[1;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Covert lastUpdate to date
updatedOn=$(date --date=@$lastUpdate)

# Print response base on days past
if [ -z "$lastUpdate" ]; then
    printf "${YELLOW}No DNF update transactions found in history.${NC}\n"
elif [ "$lastUpdate" -ge "$dayLimit" ]; then
    printf "${GREEN}DNF update has been run in the last $dayCount days. ($updatedOn)${NC}\n"
else
    printf "${RED}DNF update has NOT been run in the last $dayCount days. ($updatedOn)${NC}\n"
fi
