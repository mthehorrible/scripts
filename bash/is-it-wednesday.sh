#!/bin/bash

# Set colors
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Get the current day of the week
DAY=$(date +"%A")

# Check if the day of the week matchs then display message
if [ "$DAY" = "Wednesday" ]; then
    printf "${GREEN}
It is $DAY,
   (o)____(o)
 _/          \_
/ \----------/ \ 
\   | |  | |   /
          my dudes
${NC}\n"
else
    printf "\n${RED}No, it is $DAY${NC}\n\n"
fi
