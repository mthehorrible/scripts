#!/bin/bash

/opt/aws/dist/aws --version
if [ $? -eq 0 ]; then
	echo "aws cli is installed"
else
	echo "aws cli is NOT installed"
fi
