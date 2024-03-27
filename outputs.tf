/*
output "bucket_name" {
  value =  module.terrahouse_aws.bucket_name
}

output "website_endpoint" {
  value = module.terrahouse_aws.website_endpoint
 }
*/

output "bucket_name" {
  value = module.terrahouse_aws.bucket_name

}

output "s3_website_endpoint" {
  value =  module.terrahouse_aws.website_endpoint
  
}