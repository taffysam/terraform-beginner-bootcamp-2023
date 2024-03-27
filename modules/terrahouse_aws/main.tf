terraform {
required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.42.0"
    }
  }
}

data "aws_caller_identity" "current" {}
