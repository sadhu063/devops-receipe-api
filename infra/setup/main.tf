terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.23.0"
    }
  }


  backend "s3" {
    bucket         = "devops-recipe-api-tfstate-backend"
    key            = "tf-state-setup"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "devops-reciepe-api-tfstate-backend-lock"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      Environment = terraform.workspace
      project     = var.project
      contact     = var.contact
      ManagedBy   = "Terraform/setup"
    }
  }
}

