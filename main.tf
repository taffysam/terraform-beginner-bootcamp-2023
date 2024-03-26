
terraform {
  required_providers {
    random = {
        source = "hashicorp/random"
        version = "3.5.1"
    }

    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}



resource "random_string" "bucket_name" {
  length           = 16
  special          = false
  lower = true
  upper = false
  
 # override_special = ""
}


resource "aws_s3_bucket" "example" {
  bucket = random_string.bucket_name.result

 }

output "random_bucket_id" {
    value = random_string.bucket_name.id
 
}

output "random_bucket_name" {
    value = random_string.bucket_name.result
 
}