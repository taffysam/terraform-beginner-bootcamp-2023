variable "user_uuid" {
  type        = string
  description = "UUID of the user"

  validation {
    #name = "is-valid-uuid"
    condition     = length(var.user_uuid) == 36 && can(regex("^([a-f0-9]{8}-[a-f0-9]{4}-[1-5][a-f0-9]{3}-[89ab][a-f0-9]{3}-[a-f0-9]{12})$", var.user_uuid))
    error_message = "The user_uuid must be a valid UUID format (e.g., 'aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee')."
  }
}


variable "bucket_name" {
  type        = string
  description = "Name of the AWS S3 bucket"

  validation {
    condition     = can(regex("^[a-z0-9][a-z0-9.-]{1,61}[a-z0-9]$", var.bucket_name))
    error_message = "The bucket name must be between 3 and 63 characters long, start and end with an alphanumeric character, and can contain only lowercase letters, numbers, periods, and hyphens."
  }
}




