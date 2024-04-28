#!/bin/bash

#Set colors
CYAN='\033[0;36m'
MAGENTA='\033[1;35m'
NC='\033[0m' # No Color

#OS installed
OS=`grep PRETTY_NAME /etc/*-release | cut -d'"' -f2`

#Date OS was installed
DOB=`stat / | grep "Birth" | sed 's/Birth: //g' | cut -b 2-11`

#Kernel version
KNL=`uname -a | cut -d " " -f 3`

#Uptime
UPT=`uptime -p | cut -d " " -f 2-`

#CPU
CPU=`lscpu | grep "Model name" | cut  -d ":" -f 2 | awk '{$1=$1}1'`

#Mem
MEM=`free -h | awk 'NR==2 {print $2}'`

#Display info
printf "\n${CYAN}Hostname:      ${MAGENTA}$HOSTNAME${NC}"
printf "\n${CYAN}OS:            ${MAGENTA}$OS${NC}"
printf "\n${CYAN}Install Date:  ${MAGENTA}$DOB${NC}"
printf "\n${CYAN}Kernel:        ${MAGENTA}$KNL${NC}"
printf "\n${CYAN}Uptime:        ${MAGENTA}$UPT${NC}"
printf "\n${CYAN}CPU:           ${MAGENTA}$CPU${NC}"
printf "\n${CYAN}MEM:           ${MAGENTA}$MEM${NC}"

#Done
printf "\n\n"

