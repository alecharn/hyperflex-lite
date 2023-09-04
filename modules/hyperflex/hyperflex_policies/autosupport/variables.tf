variable "admin_state" {
  description = "Enable or disable Autosupport."
  type        = bool
}

variable "attached_to_cluster_profiles" {
  description = <<-EOT
  Cluster Profiles to which the policy is attached.

  Default is [], meaning no Cluster Profile is attached to the policy.

  It is a list of object with the following variable:
  - cluster_profile: reference to the name of the Cluster Profile.
  EOT
  type = list(object(
    {
      cluster_profile = optional(string)
    }
  ))
}

variable "description" {
  description = "Autosupport policy description."
  type        = string
}

variable "name" {
  description = "Autosupport policy name."
  type        = string
}

variable "organization" {
  description = "Organization of the policy."
  type        = string
}

variable "service_ticket_recipient" {
  description = "The recipient email address for support tickets."
  type        = string
}

variable "tags" {
  description = "Tags of the policy."
  type        = list(map(string))
}
