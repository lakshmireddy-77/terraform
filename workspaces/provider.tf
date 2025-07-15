terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.98.0"
    }
  }

  backend "s3" {
    bucket         = "state-demo1"
    key            = "remote-workspace"
    region         = "us-east-1"
    encrypt        = true
    use_lockfile   = true  # Used for local backends; has no effect with remote S3 backend
  }
}

provider "aws" {
  # Empty for now; uses default credentials
}
