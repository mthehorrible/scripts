#!/bin/bash

# Vars
instanceType="<INSTANCE-TYPE>"
keyName="<KEYPAIR>"
securityGroups="<SECURITY-GROUPS>"
subnetId="<SUBNET-ID>"
volumeSize=<DISK-SIZE>
kmsKeyId="<KMS-KEY>"
name="<NAME>"

# Vars - update when AMI changes
ami="<AMI-ID>"
snapshotId="<SNAPSHOT-ID>"

# Vars - leave alone unless you have a specific need
count=1
deviceName="/dev/sda1"
volumeType="gp3"
iops=3000
deleteOnTermination=true
encrypted=true
throughput=125

# Create EC2 Instance
aws ec2 run-instances \
    --image-id $ami \
    --count $count \
    --instance-type $instanceType \
    --key-name $keyName \
    --security-group-ids $securityGroups \
    --subnet-id $subnetId \
    --block-device-mappings "DeviceName=$deviceName,Ebs={SnapshotId=$snapshotId,VolumeSize=$volumeSize,VolumeType=$volumeType,Iops=$iops,DeleteOnTermination=$deleteOnTermination,Encrypted=$encrypted,KmsKeyId=$kmsKeyId,Throughput=$throughput}" \
    --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$name}]" \
    --metadata-options "HttpTokens=required"
#    --user-data file://userdata.ps1