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
  description = "Software Version policy description."
  type        = string
}

variable "hxdp_version" {
  description = "Desired HyperFlex Data Platform software version to apply on the HyperFlex cluster."
  type        = string
}

variable "hypervisor_version" {
  description = "Desired hypervisor version to apply for all the nodes on the HyperFlex cluster."
  type        = string
}

variable "name" {
  description = "Software Version policy name."
  type        = string
}

variable "organization" {
  description = "Organization of the policy."
  type        = string
}

variable "server_firmware_version" {
  description = "Desired server firmware version to apply on the HyperFlex Cluster."
  type        = string
}

variable "tags" {
  description = "Tags of the policy."
  type        = list(map(string))
}
