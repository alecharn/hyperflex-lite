locals {

  # Format cluster_profiles

  list_of_cluster_profiles_moid = [for cluster_profile in data.intersight_hyperflex_cluster_profile.clusterprofileMoid : cluster_profile.results[0].moid]

  list_of_cluster_profiles = [
    for cluster_profile_moid in local.list_of_cluster_profiles_moid :
    {
      moid                  = cluster_profile_moid
      class_id              = "mo.MoRef"
      object_type           = "hyperflex.ClusterProfile"
      selector              = ""
      additional_properties = ""
    }
  ]

  # Format hxdp_mgmt_ip_range

  hxdp_mgmt_ip_range = try(
    [
      {
        additional_properties = ""
        class_id              = "hyperflex.IpAddrRange",
        end_addr              = var.hxdp_mgmt_ip_range.end_addr,
        gateway               = var.hxdp_mgmt_ip_range.gateway,
        ip_addr_blocks = [
          for block_ip in var.hxdp_mgmt_ip_range.blocks :
          {
            additional_properties = ""
            class_id              = "comm.IpV4AddressBlock",
            end_address           = block_ip.block_ip_end,
            object_type           = "comm.IpV4AddressBlock",
            start_address         = block_ip.block_ip_start
          }
        ],
        netmask     = var.hxdp_mgmt_ip_range.netmask,
        object_type = "hyperflex.IpAddrRange",
        start_addr  = var.hxdp_mgmt_ip_range.start_addr
      }
  ], {})

  # Format hypervisor_mgmt_ip_range

  hypervisor_mgmt_ip_range = try(
    [
      {
        additional_properties = ""
        class_id              = "hyperflex.IpAddrRange",
        end_addr              = var.hypervisor_mgmt_ip_range.end_addr,
        gateway               = var.hypervisor_mgmt_ip_range.gateway,
        ip_addr_blocks = [
          for block_ip in var.hypervisor_mgmt_ip_range.blocks :
          {
            additional_properties = ""
            class_id              = "comm.IpV4AddressBlock",
            end_address           = block_ip.block_ip_end,
            object_type           = "comm.IpV4AddressBlock",
            start_address         = block_ip.block_ip_start
          }
        ],
        netmask     = var.hypervisor_mgmt_ip_range.netmask,
        object_type = "hyperflex.IpAddrRange",
        start_addr  = var.hypervisor_mgmt_ip_range.start_addr
      }
  ], {})

}
