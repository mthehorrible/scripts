#!/bin/bash

# Make sure go-sendxmpp is installed and config file exists
# https://salsa.debian.org/mdosch/go-sendxmpp

recipient="TO-ADDRESS"

# Show usage
if [ "$1" == "-h" ]; then
  echo "Usage: `basename $0` \"text message\""
  exit 0
fi

# Check for message
if [ -z "$1" ]
  then
    echo "Message not sent: Add message text as argument"
    exit 0
fi

# Check for multiple strings in message
if [ "$#" -ne 1 ]; then
    echo "Message not sent: You can pass only one argument. For string with spaces put it in quotes"
    exit 0
fi

echo $1 | go-sendxmpp --tls $recipient
