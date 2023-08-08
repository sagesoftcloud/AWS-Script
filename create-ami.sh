#!/bin/bash

export AWS_ACCESS_KEY_ID=""
export AWS_SECRET_ACCESS_KEY=""
REGION=""

# Replace the values below with your own values
INSTANCE_ID=""
AMI_NAME="Script Backups-Testing-$(date +'%Y-%m-%d')"
AMI_DESCRIPTION="AMI-v3"
TAG_KEY="Name"
TAG_VALUE="AMI-Demo-V3"


# Create the AMI
aws ec2 create-image --instance-id "$INSTANCE_ID" --name "$AMI_NAME" --description "$AMI_DESCRIPTION" --tag-specifications "ResourceType=image,Tags=[{Key=$TAG_KEY,Value=$TAG_VALUE}]"
