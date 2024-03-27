
terraform {
  /*cloud {
    organization = "Tafadzwa"

    workspaces {
      name = "Thaniel"
    }
  }
*/
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
