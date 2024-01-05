#!/bin/bash

#Set colors
RED='\033[0;31m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
MAGENTA='\033[1;35m'
NC='\033[0m' # No Color

printf "\nCloudFlare: ${CYAN}1.1.1.1 ${NC}&${CYAN} 1.0.0.1${NC}"
printf "\nGoogle: ${CYAN}8.8.8.8 ${NC}&${CYAN} 8.8.4.4${NC}"
printf "\nQuad9: ${CYAN}9.9.9.9 ${NC}&${CYAN} 149.112.112.112${NC}"
printf "\nOpenDNS: ${CYAN}208.67.222.222 ${NC}&${CYAN} 208.67.220.220${NC}"
printf "\nLevel3: ${CYAN}209.244.0.3 ${NC}&${CYAN} 209.244.0.4${NC}"
printf "${MAGENTA}\n\n"
fping -e 1.1.1.1 1.0.0.1 8.8.8.8 8.8.4.4 9.9.9.9 149.112.112.112 208.67.222.222 208.67.220.220 209.244.0.3 209.244.0.4
printf "${NC}\n\n"
