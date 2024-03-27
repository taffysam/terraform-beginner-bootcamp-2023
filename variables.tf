variable "user_uuid" {
  type        = string
  description = "UUID of the user"
  
  validation {
    #name = "is-valid-uuid"
    condition = length(var.user_uuid) == 36 && can(regex("^([a-f0-9]{8}-[a-f0-9]{4}-[1-5][a-f0-9]{3}-[89ab][a-f0-9]{3}-[a-f0-9]{12})$", var.user_uuid))
    error_message = "The user_uuid must be a valid UUID format (e.g., 'aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee')."
  }
}
