variable "attached_to_cluster_profiles" {
  description = <<-EOT
  Cluster Profiles to which the policy is attached.

  Default is [], meaning no Cluster Profile is attached to the policy.

  It is a list of objects with the following variable:
  - cluster_profile: reference to the name of the Cluster Profile.
  EOT
  type = list(object(
    {
      cluster_profile = optional(string)
    }
  ))
}

variable "description" {
  description = "Proxy Setting policy description."
  type        = string
}

variable "hostname" {
  description = "HTTP Proxy server FQDN or IP."
  type        = string
}

variable "name" {
  description = "Proxy Setting policy name."
  type        = string
}

variable "organization" {
  description = "Organization of the policy."
  type        = string
}

variable "password" {
  description = "The password for the HTTP Proxy."
  type        = string
}

variable "port" {
  description = "The HTTP Proxy port number. The port number of the HTTP proxy must be between 1 and 65535, inclusive."
  type        = string
}

variable "tags" {
  description = "Tags of the policy."
  type        = list(map(string))
}

variable "username" {
  description = "The username for the HTTP Proxy."
  type        = string
}
