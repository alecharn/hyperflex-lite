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
  description = "Node Configuration policy description."
  type        = string
}

variable "hxdp_mgmt_ip_range" {
  description = <<-EOT
  The range of HXDP management IPs to be assigned to the controller VMs of the nodes.

  It is an object with the following variables:
  - netmask: The netmask specified in dot decimal notation.The start address, end address, and gateway must all be within the network specified by this netmask.
  - gateway: The default gateway for the start and end IPv4 addresses.
  - blocks: Specifies the block(s) of IPv4 used for HXDP IPs. It is a list of object with the following variables:
    - block_ip_start: The start address of the IPv4 block.
    - block_ip_end: The end address of the IPv4 block.
  - start_addr: The start IPv4 address of the range.
  - end_addr: The end IPv4 address of the range.
  EOT
  type = object(
    {
      gateway = string
      netmask = string
      blocks = list(object(
        {
          block_ip_start = string
          block_ip_end   = string
        }
      ))
      start_addr = optional(string)
      end_addr   = optional(string)
    }
  )
}

variable "hypervisor_mgmt_ip_range" {
  description = <<-EOT
  The range of management IPs to be assigned to the hypervisor (ESX) of the nodes.

  It is an object with the following variables:
  - netmask: The netmask specified in dot decimal notation.The start address, end address, and gateway must all be within the network specified by this netmask.
  - gateway: The default gateway for the start and end IPv4 addresses.
  - blocks: Specifies the block(s) of IPv4 used for ESX IPs. It is a list of object with the following variables:
    - block_ip_start: The start address of the IPv4 block.
    - block_ip_end: The end address of the IPv4 block.
  - start_addr: The start IPv4 address of the range.
  - end_addr: The end IPv4 address of the range.    
  EOT
  type = object(
    {
      gateway = string
      netmask = string
      blocks = list(object(
        {
          block_ip_start = string
          block_ip_end   = string
        }
      ))
      start_addr = optional(string)
      end_addr   = optional(string)
    }
  )
}

variable "name" {
  description = "Node Configuration policy name."
  type        = string
}

variable "node_name_prefix" {
  description = <<-EOT
  The node name prefix that is used to automatically generate the default hostname for each server.
  A dash (-) will be appended to the prefix followed by the node number to form a hostname.
  This default naming scheme can be manually overridden in the node configuration. 
  The maximum length of a prefix is 60, must only contain alphanumeric characters or dash (-), and muststart with an alphanumeric character.
  EOT
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
