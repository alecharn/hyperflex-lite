###################################################
###             HyperFlex Policies              ###
###################################################


module "autosupport_policy" {
  source = "./modules/hyperflex/hyperflex_policies/autosupport"

  for_each = try({ for autosupport_policy in lookup(local.model_hyperflex_policies.intersight.hyperflex_policies, "autosupport_policies", []) : autosupport_policy.name => autosupport_policy }, {})

  admin_state                  = lookup(each.value, "admin_state", null)
  attached_to_cluster_profiles = lookup(each.value, "attached_to_cluster_profiles", null)
  description                  = lookup(each.value, "description", null)
  name                         = lookup(each.value, "name", null)
  organization                 = module.intersightorganizationMoid.intersight_organization_moid
  service_ticket_recipient     = lookup(each.value, "service_ticket_recipient", null)
  tags                         = local.tags

  depends_on = [

    module.datacenter_cluster_profile,
    module.datacenter_no_fi_cluster_profile,
    module.edge_cluster_profile,
    module.intersightorganizationMoid,

  ]

}


module "cluster_network_policy" {
  source = "./modules/hyperflex/hyperflex_policies/cluster_network"

  for_each = try({ for cluster_network_policy in lookup(local.model_hyperflex_policies.intersight.hyperflex_policies, "cluster_network_policies", []) : cluster_network_policy.name => cluster_network_policy }, {})

  attached_to_cluster_profiles = lookup(each.value, "attached_to_cluster_profiles", null)
  description                  = lookup(each.value, "description", null)
  jumbo_frame                  = lookup(each.value, "jumbo_frame", null)
  kvm_ip_range                 = lookup(each.value, "kvm_ip_range", null)
  mac_prefix                   = lookup(each.value, "mac_prefix", null)
  management_vlan              = lookup(each.value, "management_vlan", null)
  migration_vlan               = lookup(each.value, "migration_vlan", null)
  name                         = lookup(each.value, "name", null)
  network_vlans                = lookup(each.value, "network_vlans", null)
  organization                 = module.intersightorganizationMoid.intersight_organization_moid
  tags                         = local.tags
  uplink_speed                 = lookup(each.value, "uplink_speed", null)

  depends_on = [

    module.datacenter_cluster_profile,
    module.datacenter_no_fi_cluster_profile,
    module.edge_cluster_profile,
    module.intersightorganizationMoid,

  ]

}


module "cluster_storage_policy" {
  source = "./modules/hyperflex/hyperflex_policies/cluster_storage"

  for_each = try({ for cluster_storage_policy in lookup(local.model_hyperflex_policies.intersight.hyperflex_policies, "cluster_storage_policies", []) : cluster_storage_policy.name => cluster_storage_policy }, {})


  attached_to_cluster_profiles     = lookup(each.value, "attached_to_cluster_profiles", null)
  description                      = lookup(each.value, "description", null)
  disk_partition_cleanup           = lookup(each.value, "disk_partition_cleanup", null)
  logical_availability_zone_config = lookup(each.value, "logical_availability_zone_config", null)
  name                             = lookup(each.value, "name", null)
  vdi_optimization                 = lookup(each.value, "vdi_optimization", null)
  organization                     = module.intersightorganizationMoid.intersight_organization_moid
  tags                             = local.tags

  depends_on = [

    module.datacenter_cluster_profile,
    module.datacenter_no_fi_cluster_profile,
    module.edge_cluster_profile,
    module.intersightorganizationMoid,

  ]

}

module "external_fc_storage_policy" {
  source = "./modules/hyperflex/hyperflex_policies/external_fc_storage"

  for_each = try({ for external_fc_storage_policy in lookup(local.model_hyperflex_policies.intersight.hyperflex_policies, "external_fc_storage_policies", []) : external_fc_storage_policy.name => external_fc_storage_policy }, {})

  admin_state                  = lookup(each.value, "admin_state", null)
  attached_to_cluster_profiles = lookup(each.value, "attached_to_cluster_profiles", null)
  description                  = lookup(each.value, "description", null)
  exta_traffic                 = lookup(each.value, "exta_traffic", null)
  extb_traffic                 = lookup(each.value, "extb_traffic", null)
  name                         = lookup(each.value, "name", null)
  organization                 = module.intersightorganizationMoid.intersight_organization_moid
  tags                         = local.tags
  wwxn_prefix_range            = lookup(each.value, "wwxn_prefix_range", null)

  depends_on = [

    module.datacenter_cluster_profile,
    module.datacenter_no_fi_cluster_profile,
    module.edge_cluster_profile,
    module.intersightorganizationMoid,

  ]

}


module "external_iscsi_storage_policy" {
  source = "./modules/hyperflex/hyperflex_policies/external_iscsi_storage"

  for_each = try({ for external_iscsi_storage_policy in lookup(local.model_hyperflex_policies.intersight.hyperflex_policies, "external_iscsi_storage_policies", []) : external_iscsi_storage_policy.name => external_iscsi_storage_policy }, {})

  admin_state                  = lookup(each.value, "admin_state", null)
  attached_to_cluster_profiles = lookup(each.value, "attached_to_cluster_profiles", null)
  description                  = lookup(each.value, "description", null)
  exta_traffic                 = lookup(each.value, "exta_traffic", null)
  extb_traffic                 = lookup(each.value, "exta_traffic", null)
  name                         = lookup(each.value, "name", null)
  organization                 = module.intersightorganizationMoid.intersight_organization_moid
  tags                         = local.tags

  depends_on = [

    module.datacenter_cluster_profile,
    module.datacenter_no_fi_cluster_profile,
    module.edge_cluster_profile,
    module.intersightorganizationMoid,

  ]

}


module "node_config_policy" {
  source = "./modules/hyperflex/hyperflex_policies/node_config"

  for_each = try({ for node_config_policy in lookup(local.model_hyperflex_policies.intersight.hyperflex_policies, "node_config_policies", []) : node_config_policy.name => node_config_policy }, {})

  attached_to_cluster_profiles = lookup(each.value, "attached_to_cluster_profiles", null)
  description                  = lookup(each.value, "description", null)
  hxdp_mgmt_ip_range           = lookup(each.value, "hxdp_mgmt_ip_range", null)
  hypervisor_mgmt_ip_range     = lookup(each.value, "hypervisor_mgmt_ip_range", null)
  name                         = lookup(each.value, "name", null)
  node_name_prefix             = lookup(each.value, "node_name_prefix", null)
  organization                 = module.intersightorganizationMoid.intersight_organization_moid
  tags                         = local.tags

  depends_on = [

    module.datacenter_cluster_profile,
    module.datacenter_no_fi_cluster_profile,
    module.edge_cluster_profile,
    module.intersightorganizationMoid,

  ]

}


module "proxy_setting_policy" {
  source = "./modules/hyperflex/hyperflex_policies/proxy_setting"

  for_each = try({ for proxy_setting_policy in lookup(local.model_hyperflex_policies.intersight.hyperflex_policies, "proxy_setting_policies", []) : proxy_setting_policy.name => proxy_setting_policy }, {})

  attached_to_cluster_profiles = lookup(each.value, "attached_to_cluster_profiles", null)
  description                  = lookup(each.value, "description", null)
  hostname                     = lookup(each.value, "hostname", null)
  name                         = lookup(each.value, "name", null)
  organization                 = module.intersightorganizationMoid.intersight_organization_moid
  password                     = lookup(each.value, "password", null)
  port                         = lookup(each.value, "port", null)
  tags                         = local.tags
  username                     = lookup(each.value, "username", null)

  depends_on = [

    module.datacenter_cluster_profile,
    module.datacenter_no_fi_cluster_profile,
    module.edge_cluster_profile,
    module.intersightorganizationMoid,

  ]

}


module "security_policy" {
  source = "./modules/hyperflex/hyperflex_policies/security"

  for_each = try({ for security_policy in lookup(local.model_hyperflex_policies.intersight.hyperflex_policies, "security_policies", []) : security_policy.name => security_policy }, {})

  attached_to_cluster_profiles = lookup(each.value, "attached_to_cluster_profiles", null)
  description                  = lookup(each.value, "description", null)
  factory_hypervisor_password  = lookup(each.value, "factory_hypervisor_password", null)
  hxdp_root_pwd                = lookup(each.value, "hxdp_root_pwd", null)
  hypervisor_admin             = lookup(each.value, "hypervisor_admin", null)
  hypervisor_admin_pwd         = lookup(each.value, "hypervisor_admin_pwd", null)
  name                         = lookup(each.value, "name", null)
  organization                 = module.intersightorganizationMoid.intersight_organization_moid
  tags                         = local.tags

  depends_on = [

    module.datacenter_cluster_profile,
    module.datacenter_no_fi_cluster_profile,
    module.edge_cluster_profile,
    module.intersightorganizationMoid,

  ]

}


module "software_version_policy" {
  source = "./modules/hyperflex/hyperflex_policies/software_version"

  for_each = try({ for software_version_policy in lookup(local.model_hyperflex_policies.intersight.hyperflex_policies, "software_version_policies", []) : software_version_policy.name => software_version_policy }, {})

  attached_to_cluster_profiles = lookup(each.value, "attached_to_cluster_profiles", null)
  description                  = lookup(each.value, "description", null)
  hxdp_version                 = lookup(each.value, "hxdp_version", null)
  hypervisor_version           = lookup(each.value, "hypervisor_version", null)
  name                         = lookup(each.value, "name", null)
  organization                 = module.intersightorganizationMoid.intersight_organization_moid
  server_firmware_version      = lookup(each.value, "server_firmware_version", null)
  tags                         = local.tags

  depends_on = [

    module.datacenter_cluster_profile,
    module.datacenter_no_fi_cluster_profile,
    module.edge_cluster_profile,
    module.intersightorganizationMoid,

  ]

}


module "sys_config_policy" {
  source = "./modules/hyperflex/hyperflex_policies/sys_config"

  for_each = try({ for sys_config_policy in lookup(local.model_hyperflex_policies.intersight.hyperflex_policies, "sys_config_policies", []) : sys_config_policy.name => sys_config_policy }, {})

  attached_to_cluster_profiles = lookup(each.value, "attached_to_cluster_profiles", null)
  description                  = lookup(each.value, "description", null)
  dns_domain_name              = lookup(each.value, "dns_domain_name", null)
  dns_servers                  = lookup(each.value, "dns_servers", null)
  name                         = lookup(each.value, "name", null)
  ntp_servers                  = lookup(each.value, "ntp_servers", null)
  timezone                     = lookup(each.value, "timezone", null)
  organization                 = module.intersightorganizationMoid.intersight_organization_moid
  tags                         = local.tags

  depends_on = [

    module.datacenter_cluster_profile,
    module.datacenter_no_fi_cluster_profile,
    module.edge_cluster_profile,
    module.intersightorganizationMoid,

  ]

}


module "vcenter_config_policy" {
  source = "./modules/hyperflex/hyperflex_policies/vcenter_config"

  for_each = try({ for vcenter_config_policy in lookup(local.model_hyperflex_policies.intersight.hyperflex_policies, "vcenter_config_policies", []) : vcenter_config_policy.name => vcenter_config_policy }, {})

  attached_to_cluster_profiles = lookup(each.value, "attached_to_cluster_profiles", null)
  data_center                  = lookup(each.value, "data_center", null)
  description                  = lookup(each.value, "description", null)
  hostname                     = lookup(each.value, "hostname", null)
  name                         = lookup(each.value, "name", null)
  organization                 = module.intersightorganizationMoid.intersight_organization_moid
  password                     = lookup(each.value, "password", null)
  tags                         = local.tags
  username                     = lookup(each.value, "username", null)

  depends_on = [

    module.datacenter_cluster_profile,
    module.datacenter_no_fi_cluster_profile,
    module.edge_cluster_profile,
    module.intersightorganizationMoid,

  ]

}
