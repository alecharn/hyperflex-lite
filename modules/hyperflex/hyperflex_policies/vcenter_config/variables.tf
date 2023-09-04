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

variable "data_center" {
  description = "The vCenter datacenter name."
  type        = string
}

variable "description" {
  description = "vCenter Configuration policy description."
  type        = string
}

variable "hostname" {
  description = "The vCenter server FQDN or IP."
  type        = string
}

variable "name" {
  description = "vCenter Configuration policy name."
  type        = string
}

variable "organization" {
  description = "Organization of the policy."
  type        = string
}

variable "password" {
  description = "The password for authenticating with vCenter. Follow the corresponding password policy governed by vCenter."
  type        = string
}

variable "tags" {
  description = "Tags of the policy."
  type        = list(map(string))
}

variable "username" {
  description = "The vCenter username (e.g. administrator@vsphere.local)."
  type        = string
}
