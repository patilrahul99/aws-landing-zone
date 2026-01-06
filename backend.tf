terraform {
  required_version = ">= 1.5.0"

  backend "s3" {
    bucket         = "terraform-landing-zone-state"
    key            = "org/root.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
