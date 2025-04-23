#!/bin/bash

# Update and install Docker and AWS CLI
apt-get update -y
apt-get install -y docker.io awscli

# Start and enable Docker
systemctl start docker
systemctl enable docker

# Add ubuntu user to docker group
usermod -aG docker ubuntu

# Login to AWS ECR
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin <307946639945>.dkr.ecr.us-east-1.amazonaws.com

# Pull Docker image from ECR
docker pull <307946639945>.dkr.ecr.us-east-1.amazonaws.com/teja:latest

# Run Docker container
docker run -d -p 80:1337 <307946639945>.dkr.ecr.us-east-1.amazonaws.com/teja:latest
