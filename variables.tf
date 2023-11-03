variable "policy_enabled" {
  type        = bool
  default     = true
  description = "Set to false to prevent the module from creating an IAM policy"
}

variable "type" {
  type        = string
  default     = "SecureString"
  description = "Type of the parameter. Valid types are `String`, `StringList` and `SecureString`."
  validation {
    condition     = contains(["String", "StringList", "SecureString"], var.type)
    error_message = "Allowed values: `String`, `StringList`, `SecureString`."
  }
}

variable "description" {
  type        = string
  default     = ""
  description = "Description of the parameter"
}

variable "value" {
  sensitive   = true
  type        = string
  default     = ""
  description = "Value of the parameter (may be overwritten by `value_base64`)"
}

variable "value_base64" {
  sensitive   = true
  type        = string
  default     = ""
  description = "Base64 encoded value of the parameter (if set, will override `value`)"
}
