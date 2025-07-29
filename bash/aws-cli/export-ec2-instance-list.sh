#!/bin/bash

# NOTE: This is meant to be run from CloudShell

# Get date in correct format
fDate=`date +"%F"`

# Set filename
filename="ec2_inventory_$fDate.csv"

# Get EC2 instances (name, instance id, status, IP, and launch time)
aws ec2 describe-instances \
    --query 'Reservations[*].Instances[*].[[Tags[?Key==`Name`].Value] [0][0], InstanceId, State.Name, PrivateIpAddress, LaunchTime]' \
    --output text >> $filename
