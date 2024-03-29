
terraform {
  /*cloud {
    organization = "Tafadzwa"

    workspaces {
      name = "Thaniel"
    }
  }
*/
} 


module "terrahouse_aws" {
source = "./modules/terrahouse_aws"
user_uuid = var.user_uuid
bucket_name = var.bucket_name
error_html_filepath = var.error_html_filepath
index_html_filepath = var.index_html_filepath
content_version = var.content_version
}

data "aws_caller_identity" "current" {}