# AWS Landing Zone using Terraform (Enterprise-Grade IaC)

## Overview

This project implements a production-ready AWS Landing Zone using Terraform.
It establishes a secure, scalable, and governed multi-account AWS environment aligned with real enterprise best practices.

The landing zone provides:

1. Multi-account structure (DEV, TEST, UAT, PROD, SECURITY)

2. Organizational Units (OUs) for environment isolation

3. Service Control Policies (SCPs) for governance

4. Centralized logging foundation

5. Remote Terraform state with locking

## Prerequisites

- AWS Management Account credentials

- Terraform ≥ 1.5

- Unique email addresses for each AWS account

- Pre-created backend resources:

- S3 bucket for Terraform state

- DynamoDB table (optional if using lockfile)

## Key Features

No credentials stored in code

Least-privilege access enforced via SCPs

Root user access explicitly denied

Remote state secured and encrypted

Environment isolation via OUs

Modular Terraform design

## Setup Instructions

1. Clone the Repository

```
git clone https://github.com/patilrahul99/aws-landing-zone.git

```
go inside the directory:

```
cd aws-landing-zone
```
2. Configure Variables

Create a terraform.tfvars file:

```
region = "ap-south-1"

accounts = {
  security = {
    name  = "security"
    email = "security+aws@company.com"
  }
  dev = {
    name  = "dev"
    email = "dev+aws@company.com"
  }
  test = {
    name  = "test"
    email = "test+aws@company.com"
  }
  uat = {
    name  = "uat"
    email = "uat+aws@company.com"
  }
  prod = {
    name  = "prod"
    email = "prod+aws@company.com"
  }
}
```

3. Initialize Terraform

terraform init

4. Validate Configuration

terraform validate

5. Plan Infrastructure Changes

terraform plan

6. Apply the Landing Zone

terraform apply

