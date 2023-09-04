###################################################
###             HyperFlex Profiles              ###
###################################################


module "edge_cluster_profile" {
  source = "./modules/hyperflex/hyperflex_profiles/edge_cluster_profile"

  for_each = try(local.model_hyperflex_profiles.intersight.hyperflex_profiles, null) != null ? { for edge_cluster_profile in lookup(local.model_hyperflex_profiles.intersight.hyperflex_profiles, "edge_cluster_profiles", []) : edge_cluster_profile.name => edge_cluster_profile } : {}

  host_name_prefix             = lookup(each.value, "host_name_prefix", null)
  mac_address_prefix           = lookup(each.value, "mac_address_prefix", null)
  mgmt_ip_address              = lookup(each.value, "mgmt_ip_address", null)
  mgmt_platform                = lookup(each.value, "mgmt_platform", null)
  description                  = lookup(each.value, "description", null)
  name                         = lookup(each.value, "name", null)
  organization                 = module.intersightorganizationMoid.intersight_organization_moid
  replication                  = lookup(each.value, "replication", null)
  storage_cluster_auxiliary_ip = lookup(each.value, "storage_cluster_auxiliary_ip", null)
  storage_data_vlan            = lookup(each.value, "storage_data_vlan", null)
  tags                         = local.tags
  wwxn_prefix                  = lookup(each.value, "wwxn_prefix", null)

  depends_on = [

    module.intersightorganizationMoid,

  ]

}


module "datacenter_cluster_profile" {
  source = "./modules/hyperflex/hyperflex_profiles/datacenter_cluster_profile"

  for_each = try(local.model_hyperflex_profiles.intersight.hyperflex_profiles, null) != null ? { for datacenter_cluster_profile in lookup(local.model_hyperflex_profiles.intersight.hyperflex_profiles, "datacenter_cluster_profiles", []) : datacenter_cluster_profile.name => datacenter_cluster_profile } : {}

  host_name_prefix   = lookup(each.value, "host_name_prefix", null)
  mac_address_prefix = lookup(each.value, "mac_address_prefix", null)
  mgmt_ip_address    = lookup(each.value, "mgmt_ip_address", null)
  mgmt_platform      = lookup(each.value, "mgmt_platform", null)
  description        = lookup(each.value, "description", null)
  name               = lookup(each.value, "name", null)
  organization       = module.intersightorganizationMoid.intersight_organization_moid
  replication        = lookup(each.value, "replication", null)
  storage_data_vlan  = lookup(each.value, "storage_data_vlan", null)
  tags               = local.tags
  wwxn_prefix        = lookup(each.value, "wwxn_prefix", null)

  depends_on = [

    module.intersightorganizationMoid,

  ]

}


module "datacenter_no_fi_cluster_profile" {
  source = "./modules/hyperflex/hyperflex_profiles/datacenter_no_fi_cluster_profile"

  for_each = try(local.model_hyperflex_profiles.intersight.hyperflex_profiles, null) != null ? { for datacenter_no_fi_cluster_profile in lookup(local.model_hyperflex_profiles.intersight.hyperflex_profiles, "datacenter_no_fi_cluster_profiles", []) : datacenter_no_fi_cluster_profile.name => datacenter_no_fi_cluster_profile } : {}

  host_name_prefix   = lookup(each.value, "host_name_prefix", null)
  mac_address_prefix = lookup(each.value, "mac_address_prefix", null)
  mgmt_ip_address    = lookup(each.value, "mgmt_ip_address", null)
  mgmt_platform      = lookup(each.value, "mgmt_platform", null)
  description        = lookup(each.value, "description", null)
  name               = lookup(each.value, "name", null)
  organization       = module.intersightorganizationMoid.intersight_organization_moid
  replication        = lookup(each.value, "replication", null)
  storage_data_vlan  = lookup(each.value, "storage_data_vlan", null)
  tags               = local.tags
  wwxn_prefix        = lookup(each.value, "wwxn_prefix", null)

  depends_on = [

    module.intersightorganizationMoid,

  ]

}


###################################################
###                Node Profiles                ###
###################################################


module "node_profile" {
  source = "./modules/hyperflex/hyperflex_profiles/node_profile"

  for_each = try(local.model_hyperflex_profiles.intersight.hyperflex_profiles, null) != null ? { for node_profile in lookup(local.model_hyperflex_profiles.intersight.hyperflex_profiles, "node_profiles", []) : node_profile.server_name => node_profile } : {}

  attached_to_hx_cluster     = lookup(each.value, "attached_to_hx_cluster", null)
  description                = lookup(each.value, "description", null)
  hxdp_data_ip               = lookup(each.value, "hxdp_data_ip", null)
  hxdp_storage_client_ip     = lookup(each.value, "hxdp_storage_client_ip", null)
  hypervisor_data_ip         = lookup(each.value, "hypervisor_data_ip", null)
  node_role                  = lookup(each.value, "node_role", null)
  server_hxdp_mgmt_ip        = lookup(each.value, "server_hxdp_mgmt_ip", null)
  server_hypervisor_mgmt_ip  = lookup(each.value, "server_hypervisor_mgmt_ip", null)
  server_name                = lookup(each.value, "server_name", null)
  server_hypervisor_hostname = lookup(each.value, "server_hypervisor_hostname", null)
  tags                       = local.tags

  depends_on = [

    # module.datacenter_cluster_profile,
    # module.datacenter_no_fi_cluster_profile,
    # module.edge_cluster_profile,
    # module.node_config_policy,
    module.intersightorganizationMoid,

  ]

}
