variable "user_uuid" {
  type        = string
  description = "UUID of the user"

 }


variable "bucket_name" {
  type        = string
  description = "Name of the AWS S3 bucket"

  }

variable "content_version" {
  description = "Content version number"
  type        = number

  
}



variable "index_html_filepath" {
  type        = string
  description = "File path to the index.html file"
  
  validation {
    condition     = can(fileexists(var.index_html_filepath))
    error_message = "The specified index.html file does not exist."
  }
}


variable "error_html_filepath" {
  type        = string
  description = "File path to the error.html file"
  
  validation {
    condition     = can(fileexists(var.error_html_filepath))
    error_message = "The specified error.html file does not exist."
  }
}



