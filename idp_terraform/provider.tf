terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "b2c-tfstate"
    key    = "nd-github"
    region = "us-west-2"
  }
}

provider "aws" {
  region = "us-east-1"
}
