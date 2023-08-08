#!/bin/bash
export AWS_ACCESS_KEY_ID=""
export AWS_SECRET_ACCESS_KEY=""
REGION="ap-southeast-1"
# Prompt for the security group ID
sg_id=

# Prompt for the IP address to whitelist
read -p "Enter the IP address to whitelist (in CIDR notation): " ip_address

# Authorize inbound traffic from the specified IP address
aws ec2 authorize-security-group-ingress --group-id "$sg_id" --protocol tcp --port 22 --cidr "$ip_address"

echo "Inbound traffic from $ip_address has been whitelisted for security group $sg_id"
