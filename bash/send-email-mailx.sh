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

echo $message | mailx -v \
    -r $sender \
    -s "$subject" \
    -S smtp=$mailServer:$port \
    -S smtp-use-starttls \
    -S smtp-auth=login \
    -S smtp-auth-user=$user \
    -S smtp-auth-password=$pass \
    $recipient