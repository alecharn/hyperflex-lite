variable "admin_state" {
  description = "Enable or disable external iSCSI storage configuration."
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
  description = "External iSCSI Storage Connectivity policy description."
  type        = string
}

variable "exta_traffic" {
  description = <<-EOT
  VLAN for the primary Fabric Interconnect (FI-A), external iSCSI storage traffic.

  It is an object with the following variables:
  - name: Name of the VLAN associated with the iSCSI vNIC, on the primary Fabric Interconnect (FI-A). The name can be from 1 to 32 characters long and can contain a combination of alphanumeric characters, underscores, and hyphens.
  - vlan_id: ID of the VLAN associated with the iSCSI vNIC, on the primary Fabric Interconnect (FI-A).The ID can be any number between 0 and 4095, inclusive.
  EOT
  type = object(
    {
      name    = string
      vlan_id = string
    }
  )
}

variable "extb_traffic" {
  description = <<-EOT
  VLAN for the subordinate Fabric Interconnect (FI-B), external iSCSI storage traffic.

  It is an object with the following variables:
  - name: Name of the VLAN associated with the iSCSI vNIC, on the subordinate Fabric Interconnect (FI-B). The name can be from 1 to 32 characters long and can contain a combination of alphanumeric characters, underscores, and hyphens.
  - vlan_id: ID of the VLAN associated with the iSCSI vNIC, on the subordinate Fabric Interconnect (FI-B). The ID can be any number between 0 and 4095, inclusive.
  EOT
  type = object(
    {
      name    = string
      vlan_id = string
    }
  )
}

variable "name" {
  description = "External iSCSI Storage Connectivity policy name."
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
