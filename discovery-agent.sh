#bin/bash
curl -o ./aws-discovery-agent.tar.gz https://s3-us-east-1.amazonaws.com/aws-discovery-agent.us-east-1/linux/latest/aws-discovery-agent.tar.gz
tar -xzf aws-discovery-agent.tar.gz
sudo bash install -r us-east-1 -k <ACCESS KEY> -s <Secret Access Key>
