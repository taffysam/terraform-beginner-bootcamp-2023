
terraform {
  /*cloud {
    organization = "Tafadzwa"

    workspaces {
      name = "Thaniel"
    }
  }
*/
  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
