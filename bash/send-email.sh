#!/bin/bash

message="Message"
subject="Subject"
sender="Sender"
recipient="Recipient"

echo $message | mail -s "$subject" -r "$sender" "$recipient"
