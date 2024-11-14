

README Documentation For The Project:

Time API Deployment on AWS ECS with Terraform

This project deploys a simple API that returns the current server time on AWS Elastic Container Service (ECS) using Terraform. The application is accessible via a load-balanced URL and deployed in a secure and scalable environment. 

Table of Contents:
- Project Overview
- Architecture
- Prerequisites
- Setup Instructions

- Step 1: Create app using visual studio code, 
Create Dockerfile in the project repository
Build docker image with app
pushed Docker image to Dockerhub

 - Step 2: Deploy Infrastructure with Terraform

 - Step 3: Deploy the Application 
- Accessing the Application with an IP address uniquely generated from AWS EC2 instance

Project Overview
This project involves:
1. Deploying a simple API application that returns the current server time.
2. Provisioning AWS infrastructure using Terraform.

The application is written in Python (Flask) and containerized using Docker and Dockerhub

Architecture
The deployment includes the following AWS resources:
VPC - with public and private subnets for network security.
ECS (Elastic Container Service) - to run the Docker container.
ALB (Application Load Balancer) - to provide an HTTPS endpoint and manage traffic.

Prerequisites:

Ensure you have the following before starting:
Terraform
AWS CLI - configured with necessary permissions
Docker - for building and testing the application locally
Docker Hub
Access to AWS Management Console
Ubuntu Desktop or Windows WSL


Setup Instructions
Step 1: Run command update and upgrade on the CLI
Create application
Build Docker image
Push to Docker Hub
Deploy

Step 2: Deploy Infrastructure with Terraform**

Terraform is used to provision the infrastructure. Follow these steps:

1. Initialize Terraform in each module directory (vpc, ecs, alb):

  # bash
   terraform init

2. Apply Terraform Configuration - to create AWS resources:

   #bash
   terraform apply

3. Confirm Resource Creation - by typing `yes` when prompted.

Step 3: Deploy the Application:

1. Build and Push Docker Image - to Amazon Elastic Container Registry (ECR):
   - Tag and push the image to your ECR repository.

   #bash
   docker build -t time-api .
   docker tag time-api:latest <ECR-REPOSITORY-URI>:latest
   docker push <ECR-REPOSITORY-URI>:latest

Docker Hub:
docker pull ifeanyidev001/server-time-api
docker pull ifeanyidev001/server-time-api:latest
https://hub.docker.com/layers/ifeanyidev001/server-time-api/latest/images/sha256-c5dcdc3007107620ef420d22bc66d4344c95228a77da50ab4217c21fe0ba23a8?context=explore

CloudFront: Used for Https implementation.

Update Security Groups
Ensure your security group allows inbound traffic on ports 80 and 443:
Go to EC2 Dashboard → Security Groups → Select your instance’s security group.
Under Inbound Rules, add rules for HTTP (port 80) and HTTPS (port 443)

2. Update ECS Service:
   - Configure ECS task definitions and update the ECS service to pull the latest image.

Accessing the Application
After deployment, the Application Load Balancer (ALB) will provide a URL to access the API.

1. Locate the ALB URL - in the Terraform output or AWS console.
2. Access the API - by visiting:

 This endpoint should return the server's current time in Python

Infrastructure deployment using Terraform on AWS ECS:

Prerequisites:
- AWS account and credentials configured 
- Terraform installed 
- Docker to build and push images

Steps to Deploy 
1.Initialize Terraform: 
bash ==> 
terraform init

terraform plan

terraform apply






Troubleshooting:
-Application Not Accessible: Check security group rules for the ALB and ECS instances.
- ECS Task Failing: Review ECS logs to identify any issues with the container.
-Encountered errors while pushing Docker image to ECR before pulling to ECS and because of project deadline, I had to make provision for Docker hub implementing the best DevOps practice.
