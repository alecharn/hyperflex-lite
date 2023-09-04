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
  description = "Storage policy description."
  type        = string
}

variable "disk_partition_cleanup" {
  description = "If enabled, formats existing disk partitions (destroys all user data)."
  type        = bool
}

variable "logical_availability_zone_config" {
  description = <<-EOT
  *** not applicable to Edge cluster ***

  Enable or disable Logical Availability Zones (LAZ). If enabled, HyperFlex Data Platform automatically selects and groups nodes into different availability zones. 
  
  For HyperFlex Data Platform versions prior to 3.0 release, this setting does not apply. 
  For HyperFlex Data Platform versions 3.0 or higher, this setting is only applicable to HyperFlex systems with 8 or more converged nodes.
  EOT
  type        = bool
}

variable "name" {
  description = "Storage policy name."
  type        = string
}

variable "organization" {
  description = "Organization of the policy."
  type        = string
}

variable "tags" {
  description = "Tags of the policy."
  type        = list(map(string))
}

variable "vdi_optimization" {
  description = <<-EOT
  *** Hybrid HyperFlex systems only ***

  Enable or disable VDI optimization.
  EOT
  type        = bool
}
