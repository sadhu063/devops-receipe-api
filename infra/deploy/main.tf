terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.23.0"
    }
  }


  backend "s3" {
    bucket               = "devops-recipe-api-tfstate-backend"
    key                  = "tf-state-deploy"
    region               = "us-east-1"
    workspace_key_prefix = "tf-state-deploy-env"
    encrypt              = true
    dynamodb_table       = "devops-reciepe-api-tfstate-backend-lock"
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
      ManagedBy   = "Terraform/deploy"
    }
  }
}


locals {
  prefix = "${var.prefix}-${terraform.workspace}"
}


data "aws_region" "current" {

}


