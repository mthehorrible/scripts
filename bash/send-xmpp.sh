#!/bin/bash

# Make sure go-sendxmpp is installed
# https://salsa.debian.org/mdosch/go-sendxmpp

# Message settings
recipient="TO-ADDRESS"
message="MESSAGE"

# Authentication
user="USER-ACCOUNT"
pass="PASSWORD"

echo $message | go-sendxmpp \
    -u $user \
    -p $pass \
    --tls \
    $recipient