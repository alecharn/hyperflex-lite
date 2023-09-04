variable "admin_state" {
  description = "Enable or disable external FC storage configuration."
  type        = bool
}

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
  description = "External FC Storage Connectivity policy description."
  type        = string
}

variable "exta_traffic" {
  description = <<-EOT
  VSAN for the primary Fabric Interconnect (FI-A), external FC storage traffic.

  It is an object with the following variables:
  - name: The name of the VSAN for the primary Fabric Interconnect (FI-A). The name can be from 1 to 32 characters long and can contain a combination of alphanumeric characters, underscores, and hyphens.
  - vsan_id: The unique identifier assigned to the network for the primary Fabric Interconnect (FI-A). The ID can be any number between 1 and 4093, inclusive.
  EOT
  type = object(
    {
      name    = string
      vsan_id = string
    }
  )
}

variable "extb_traffic" {
  description = <<-EOT
  VSAN for the subordinate Fabric Interconnect (FI-B), external FC storage traffic.

  It is an object with the following variables:
  - name: The name of the VSAN for the subordinate Fabric Interconnect (FI-B). The name can be from 1 to 32 characters long and can contain a combination of alphanumeric characters, underscores, and hyphens.
  - vsan_id: The unique identifier assigned to the network for the subordinate Fabric Interconnect (FI-B). The ID can be any number between 1 and 4093, inclusive.
  EOT
  type = object(
    {
      name    = string
      vsan_id = string
    }
  )
}

variable "name" {
  description = "External FC Storage Connectivity policy name."
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

variable "wwxn_prefix_range" {
  description = <<-EOT
  The range of WWxN addresses to use for the FC storage configuration.

  It is an object with the following variables:
  - end_address: End address of the WWxN range in the form of 20:00:00:25:B5:XX.
  - start_address: Start address of the WWxN range in the form of 20:00:00:25:B5:XX.
  EOT
  type = object(
    {
      end_address   = string
      start_address = string
    }
  )
}
