terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.98.0"
    }
  }

  backend "s3" {
    bucket         = "state-demo1"
    key            = "vpc-test"
    region         = "us-east-1"
    encrypt        = true
    use_lockfile   = true  # Used for local backends; has no effect with remote S3 backend
  }
}

provider "aws" {
  region = "us-east-1"
  # Empty for now; uses default credentials
}
