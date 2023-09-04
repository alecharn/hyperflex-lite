# A profile specifying configuration settings for a Datacenter HyperFlex cluster.

resource "intersight_hyperflex_cluster_profile" "datacenter_cluster_profile" {
  description        = var.description
  host_name_prefix   = var.host_name_prefix
  mac_address_prefix = var.mac_address_prefix
  mgmt_ip_address    = var.mgmt_ip_address
  mgmt_platform      = var.mgmt_platform
  name               = var.name
  organization {
    object_type = "organization.Organization"
    moid        = var.organization
  }
  replication = var.replication
  storage_data_vlan {
    name        = var.storage_data_vlan.name
    object_type = "hyperflex.NamedVlan"
    vlan_id     = var.storage_data_vlan.vlan_id
  }
  tags        = var.tags
  wwxn_prefix = var.wwxn_prefix
}
