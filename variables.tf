###################################################
###               Intersight API                ###
###################################################

variable "intersight_api_key_id" {
  description = "Intersight API Key ID."
  sensitive   = true
  type        = string
}

variable "intersight_endpoint" {
  default     = "https://intersight.com"
  description = "Intersight URL."
  type        = string
}

variable "intersight_api_secret_key" {
  description = "Intersight API Secret Key."
  sensitive   = true
  type        = string
}


###################################################
###               Intersight Org                ###
###################################################

variable "organization" {
  description = "Organization that will be the target for the creation of all the policies and profiles."
  type        = string
}


###################################################
###               Intersight Tags               ###
###################################################

variable "tags" {
  default = [
    {
      key   = "configuration"
      value = "terraform"
    }
  ]
  description = "Tags to append to an Intersight object."
  type = list(object(
    {
      key   = optional(string),
      value = optional(string),
    }
  ))
}
