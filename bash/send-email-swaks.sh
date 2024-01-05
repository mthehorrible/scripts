#!/bin/bash

# Message settings
sender="FROM-ADDRESS"
recipient="TO-ADDRESS"
subject="SUBJECT"
message="MESSAGE"

# Authentication
user="USER-ACCOUNT"
pass="PASSWORD"
mailServer="SMTP-SERVER"
port="SMTP-PORT"

swaks --from $sender \
    --h-Subject: "$subject" \
    --auth LOGIN --auth-user $user --auth-pass $pass \
    --to $recipient \
    --server $mailServer --port $port -tls \
    --add-header 'Content-Type: text/plain; charset="utf-8"' \
    --body "$message"
