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
  description = "Cluster Network policy description."
  type        = string
}

variable "jumbo_frame" {
  description = "Enable or disable Jumbo Frames (MTU=9000). Jumbo Frames are used by Storage Network, VM Migration Network."
  type        = bool
}

variable "kvm_ip_range" {
  description = <<-EOT
  *** not applicable to Edge cluster ***

  The Out-of-band KVM IP range. Configures the service profiles to use IP addresses within this range for setting the KVM IP of a server.
  One IP address per node is required. The range must fall in the same address range as UCS Manager management interfaces.

  It is an object with the following variables:
  - netmask: The netmask specified in dot decimal notation.The start address, end address, and gateway must all be within the network specified by this netmask.
  - gateway: The default gateway for the start and end IPv4 addresses.
  - blocks: Specifies the block(s) of IPv4 used for KVM. It is a list of object with the following variables:
    - block_ip_start: The start address of the IPv4 block.
    - block_ip_end: The end address of the IPv4 block.
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
    }
  )
}

variable "mac_prefix" {
  description = "The MAC address prefix range for configuring vNICs. Configures the service profiles to use MAC address prefixes within this range for setting the MAC address of server vNICs. Form: 00:25:B5:XX."
  type        = string
}

variable "management_vlan" {
  description = <<-EOT
  The VLAN for the management network. VLAN must have access to Intersight.

  It is an object with the following variables:
  - name *** not applicable to Edge cluster ***: Name of the management VLAN. The name can be from 1 to 32 characters long and can contain a combination of alphanumeric characters, underscores, and hyphens.
  - vlan_id: VLAN ID of the management VLAN. An ID of 0 means the traffic is untagged. The VLAN ID can be any number between 0 and 4095, inclusive.
  EOT
  type = object(
    {
      name    = optional(string)
      vlan_id = string
    }
  )
}

variable "migration_vlan" {
  description = <<-EOT
  *** not applicable to Edge cluster ***

  The VM migration VLAN (vmotion). This VLAN is used for transfering VMs from one host to another during operations such a cluster upgrade. The name can be from 1 to 32 characters long and can contain a combination of alphanumeric characters, underscores, and hyphens.
  
  It is an object with the following variables:
  - name: Name of the migration VLAN. The name can be from 1 to 32 characters long and can contain a combination of alphanumeric characters, underscores, and hyphens.
  - vlan_id: VLAN ID of the management VLAN. An ID of 0 means the traffic is untagged. The ID can be any number between 0 and 4095, inclusive.
  EOT
  type = object(
    {
      name    = string
      vlan_id = string
    }
  )
}

variable "name" {
  description = "Cluster Network policy name."
  type        = string
}

variable "network_vlans" {
  description = <<-EOT
  *** not applicable to Edge cluster ***

  Networks VLAN for the guest VMs.

  It is a list of objects with the following variables:
  - name: Name of the network VLAN.The name can be from 1 to 32 characters long and can contain a combination of alphanumeric characters, underscores, and hyphens.
  - vlan_id: VLAN ID of the network VLAN. An ID of 0 means the traffic is untagged. The ID can be any number between 0 and 4095, inclusive.
  EOT
  type = list(object(
    {
      name    = string
      vlan_id = string
    }
  ))
}

variable "organization" {
  description = "Organization of the policy."
  type        = string
}

variable "tags" {
  description = "Tags of the policy."
  type        = list(map(string))
}

variable "uplink_speed" {
  description = <<-EOT
  *** not applicable to Datacenter cluster ***

  Link speed of the server adapter port to the upstream switch. 
  ==> When the policy is attached to a cluster profile with EDGE management platform, the uplink speed can be '1G' or '10G+'. Use '10G+' for link speeds of 10G or above. 
  ==> When the policy is attached to a cluster profile with Fabric Interconnect management platform, the uplink speed can be 'default' only.
  EOT
  type        = string
}
