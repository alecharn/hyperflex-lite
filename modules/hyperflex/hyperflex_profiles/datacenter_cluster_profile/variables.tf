variable "description" {
  description = "Cluster Profile description."
  type        = string
}

variable "host_name_prefix" {
  description = <<-EOT
  The node name prefix that is used to automatically generate the default hostname for each server.
  A dash (-) will be appended to the prefix followed by the node number to form a hostname.
  This default naming scheme can be manually overridden in the node configuration.
  The maximum length of a prefix is 60, must only contain alphanumeric characters or dash (-), and muststart with an alphanumeric character.
  EOT
  type        = string
}

variable "mac_address_prefix" {
  description = "The MAC address prefix in the form of 00:25:B5:XX."
  type        = string
}

variable "mgmt_ip_address" {
  description = "The management IP address for the HyperFlex cluster."
  type        = string
}

variable "mgmt_platform" {
  description = <<-EOT
  The management platform for the HyperFlex cluster.
  * FI - The host servers used in the cluster deployment are managed by a UCS Fabric Interconnect.
  * EDGE - The host servers used in the cluster deployment are standalone severs.
  * DC-No-FI - The host servers used in the cluster deployment are standalone servers with the DC Advantage license.
  EOT
  type        = string
}

variable "name" {
  description = "Cluster Profile name."
  type        = string
}

variable "organization" {
  description = "Organization of the policy."
  type        = string
}

variable "replication" {
  description = "The number of copies of each data block written."
  type        = string
}

variable "storage_data_vlan" {
  description = <<-EOT
  The VLAN for the HyperFlex storage data traffic.

  It is an object with the following variables:
  - name *** not applicable to Edge / DC-no-FI cluster ***: Name of the storage VLAN. The name can be from 1 to 32 characters long and can contain a combination of alphanumeric characters, underscores, and hyphens.
  - vlan_id: VLAN ID of the storage VLAN. An ID of 0 means the traffic is untagged. The VLAN ID can be any number between 0 and 4095, inclusive.
  EOT
  type = object(
    {
      vlan_id = string
      name    = optional(string)
    }
  )
}

variable "tags" {
  description = "Tags of the policy."
  type        = list(map(string))
}

variable "wwxn_prefix" {
  description = <<-EOT
   *** not applicable to Edge and DC-no-FI clusters ***

  The WWxN prefix in the form of 20:00:00:25:B5:XX."
  EOT
  type        = string
}
