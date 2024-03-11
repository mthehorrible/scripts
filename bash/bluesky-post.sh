#!/bin/bash

# Set creds
BLUESKY_HANDLE=""
BLUESKY_PASSWORD=""

# Prompt for message to post
read -p "Enter message: " MESSAGE

# Create Bluesky session
BLUESKY_SESS_RESPONSE=$(curl --silent \
    -X POST https://bsky.social/xrpc/com.atproto.server.createSession \
    -H "Content-Type: application/json" \
    -d '{"identifier": "'"$BLUESKY_HANDLE"'", "password": "'"$BLUESKY_PASSWORD"'"}')

# Get Bluesky access token from session response
ACCESS_JWT=$(echo $BLUESKY_SESS_RESPONSE | jq -r '.accessJwt')

# Post Bluesky message
BLUESKY_POST_RESPONSE=$(curl --silent \
    -X POST https://bsky.social/xrpc/com.atproto.repo.createRecord \
    -H "Authorization: Bearer $ACCESS_JWT" \
    -H "Content-Type: application/json" \
    -d "{\"repo\": \"$BLUESKY_HANDLE\", \"collection\": \"app.bsky.feed.post\", \"record\": {\"text\": \"$MESSAGE\", \"createdAt\": \"$(date -u +%Y-%m-%dT%H:%M:%SZ)\"}}")

# Print Bluesky post response
echo $BLUESKY_POST_RESPONSE
