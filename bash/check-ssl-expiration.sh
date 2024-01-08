#!/bin/bash

#Set colors
CYAN='\033[0;36m'
MAGENTA='\033[1;35m'
NC='\033[0m' # No Color

DOMAINS=(
    "duckduckgo.com"
    "mozilla.org"
)
PORT="443"

for DOMAIN in "${DOMAINS[@]}";
do
    RESULT=$(echo | openssl s_client -servername $DOMAIN -connect $DOMAIN:$PORT 2>/dev/null | openssl x509 -noout -enddate | cut -d'=' -f2)
    printf "The SSL Certificate for ${MAGENTA}$DOMAIN${NC} expires on ${CYAN}$RESULT${NC}\n"
done
