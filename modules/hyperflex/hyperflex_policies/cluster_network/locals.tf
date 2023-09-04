locals {

  # Format kvm_ip_range

  kvm_ip_range = try(
    [
      {
        additional_properties = ""
        class_id              = "hyperflex.IpAddrRange"
        end_addr              = ""
        gateway               = var.kvm_ip_range.gateway
        ip_addr_blocks = [
          for block_ip in var.kvm_ip_range.blocks :
          {
            additional_properties = ""
            class_id              = "comm.IpV4AddressBlock"
            end_address           = block_ip.block_ip_end
            object_type           = "comm.IpV4AddressBlock"
            start_address         = block_ip.block_ip_start
          }
        ]
        netmask     = var.kvm_ip_range.netmask
        object_type = "hyperflex.IpAddrRange"
        start_addr  = ""
      }

    ]
    ,
    [
      {
        additional_properties = ""
        class_id              = "hyperflex.IpAddrRange"
        end_addr              = ""
        gateway               = ""
        ip_addr_blocks        = []
        netmask               = ""
        object_type           = "hyperflex.IpAddrRange"
        start_addr            = ""
      }
    ]
  )


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


  # Format network_vlans 

  list_of_network_vlans = try(
    [
      for network_vlan in var.network_vlans :
      {
        additional_properties = ""
        class_id              = "hyperflex.NamedVlan"
        name                  = network_vlan.name
        object_type           = "hyperflex.NamedVlan"
        vlan_id               = network_vlan.vlan_id
      }
    ]
  , [])


  # Format vm_migration_vlan

  vm_migration_vlan = try(
    [
      {
        additional_properties = ""
        class_id              = "hyperflex.NamedVlan"
        name                  = var.migration_vlan.name
        object_type           = "hyperflex.NamedVlan"
        vlan_id               = var.migration_vlan.vlan_id
      }
    ]
    , [
      {
        additional_properties = ""
        class_id              = "hyperflex.NamedVlan"
        name                  = ""
        object_type           = "hyperflex.NamedVlan"
        vlan_id               = 0
      }
    ]
  )

}
