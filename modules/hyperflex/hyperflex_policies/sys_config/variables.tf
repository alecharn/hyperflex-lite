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
  description = "System Configuration policy description."
  type        = string
}

variable "dns_domain_name" {
  description = "The DNS Search Domain Name. This setting applies to HyperFlex Data Platform 3.0 or later only."
  type        = string
}

variable "dns_servers" {
  description = "List of DNS servers."
  type        = list(string)
}

variable "name" {
  description = "System Configuration policy name."
  type        = string
}

variable "ntp_servers" {
  description = "List of NTP servers."
  type        = list(string)
}

variable "organization" {
  description = "Organization of the policy."
  type        = string
}

variable "tags" {
  description = "Tags of the policy."
  type        = list(map(string))
}

variable "timezone" {
  description = "The timezone of the HyperFlex cluster's system clock."
  type        = string
}
