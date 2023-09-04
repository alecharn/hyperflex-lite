# Policies specifying VLANs for management, VM migration (not applicable to Edge / DC-no-FI cluster), VM traffic (not applicable to Edge / DC-no-FI cluster), and KVM IPs (not applicable to Edge / DC-no-FI cluster).

resource "intersight_hyperflex_cluster_network_policy" "cluster_network_policy" {
  cluster_profiles = local.list_of_cluster_profiles
  description      = var.description
  jumbo_frame      = var.jumbo_frame
  kvm_ip_range     = local.kvm_ip_range
  mac_prefix_range {
    start_addr = var.mac_prefix
    end_addr   = var.mac_prefix
  }
  mgmt_vlan {
    name        = var.management_vlan.name
    object_type = "hyperflex.NamedVlan"
    vlan_id     = var.management_vlan.vlan_id
  }
  name = var.name
  organization {
    object_type = "organization.Organization"
    moid        = var.organization
  }
  tags              = var.tags
  uplink_speed      = var.uplink_speed
  vm_migration_vlan = local.vm_migration_vlan
  vm_network_vlans  = local.list_of_network_vlans

  depends_on = [

    data.intersight_hyperflex_cluster_profile.clusterprofileMoid,

  ]

}
