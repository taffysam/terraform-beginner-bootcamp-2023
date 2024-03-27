
# Terraform Beginner Bootcamp 2023 - Week 1

## Root Module Structure

Our root module structure is as follows:
```
- PROJECT_ROOT
  - varaibles.tf     : stores the structure os variables
  - main.tf          : everything else
  - providers.tf     : stores required providers and their configurations
  - outputs.tf       : stores outputs
  - terraform.tfvars : stores data os variables we need to load 
  - README.md        : required for root modules
```

[Root Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)


## Passing input Variables



## Module Sources

Can be from 3 main sources:
- GitHub
- Local
- Terraform Registry
  
```terraform
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
}
 ``` 
 [Module Sources](https://developer.hashicorp.com/terraform/language/modules/sources) 

# Terraform Bootcamp Week1 Update

## The Terraform File structure is made up of the following:

  Root
  ├── variables.tf
  ├── outputs.tf
  ├── main.tf
  ├── providers.tf
  ├── terraform.tfvars
  └── README.md


[Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)


## Terraform Cloud Variables
In terraform we can set **environmental** and **terraform** variables
- **Environmental Variables** : set in bash terminal eg AWS_DEFAULT_REGION
- **Terraform variables**  : set in tfvars eg: user_uuid

We can set terraform could variables to be senstive so that there are not shown visbly in UI 


## Loading Terraform Variables
We can use the `-var` flag to set an input variable or ovverride a variable in tfvars file eg. `terraform -var user_id="my-user-id"'


## Var File Flag
NB Homework

## Terraform.tfvars
- default file to load in terrafrom variables in blunk

## auto.tfvars
NB Homework


## Order of Terraform variables
document which terraform variables take precedence

[Terraform Input Values](https://developer.hashicorp.com/terraform/language/values/variables)


