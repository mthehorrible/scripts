#!/bin/bash

# Vars
instanceId="<INSTANCE-ID>"

aws ec2 terminate-instances --instance-ids $instanceId