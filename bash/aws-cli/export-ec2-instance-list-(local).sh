#!/bin/bash

profile=ACCOUNT-ROLE
region=REGION
filename=instances.csv

aws ec2 describe-instances \
    --profile $profile \
	--region $region \
    --query 'Reservations[*].Instances[*].[[Tags[?Key==`Name`].Value] [0][0], InstanceId, State.Name, PrivateIpAddress, LaunchTime]' \
    --output text >> $filename

echo "Exporting all EC2 instances to $filename"