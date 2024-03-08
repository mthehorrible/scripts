#!/bin/bash

# Set server and auth token
server=""
authToken=""

# Prompt for message to post
read -p "Enter message: " message

# Put info together
url="https://$server/api/v1/statuses"
auth="Authorization: Bearer $authToken"
params="status=$message"

# Post message
r=$(curl --silent \
        --write-out '\nResponse: %{http_code}\n' \
        --output /dev/null \
        --url $url \
        --header "$auth" \
        --form "$params")

# Show response code
echo $r
