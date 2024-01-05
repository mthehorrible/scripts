#!/bin/bash 

dig TXT +short o-o.myaddr.l.google.com @ns1.google.com

# Secondary method
#wget -O - -q icanhazip.com