#!/bin/bash

# Get EC2 instances (name, instance id, status, IP, and launch time)
aws ec2 describe-instances \
    --query 'Reservations[*].Instances[*].[[Tags[?Key==`Name`].Value] [0][0], InstanceId, State.Name, PrivateIpAddress, LaunchTime]' \
    --output table
