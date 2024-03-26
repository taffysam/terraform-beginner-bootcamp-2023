
terraform {
  required_providers {
    random = {
        source = "hashicorp/random"
        version = "3.5.1"
    }
  }
}



resource "random_string" "bucket_name" {
  length           = 16
  special          = false
 # override_special = ""
}

output "random_bucket_id" {
    value = random_string.bucket_name.id
 
}

output "random_bucket_name" {
    value = random_string.bucket_name.result
 
}