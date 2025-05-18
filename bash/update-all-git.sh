#!/bin/bash

#Settings
gitDir="<GIT-FOLDER>"

#Set colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
MAGENTA='\033[1;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

for d in $gitDir/*/ ; do
    printf "\n${YELLOW}Updating $d ${NC}\n"
    cd "$d"
    if [ -d .git ]; then
        git fetch
        git pull
    fi;
    printf "\n"
done
