# A policy specifying node details such as management and storage data IP ranges. 
# The data IPs are automatically assigned in a /24 subnet in the range 169.254.x.2 to 169.254.239.254.

resource "intersight_hyperflex_node_config_policy" "node_config_policy" {
  cluster_profiles = local.list_of_cluster_profiles
  description      = var.description
  hxdp_ip_range    = local.hxdp_mgmt_ip_range
  mgmt_ip_range    = local.hypervisor_mgmt_ip_range
  name             = var.name
  node_name_prefix = var.node_name_prefix
  organization {
    object_type = "organization.Organization"
    moid        = var.organization
  }
  tags = var.tags

  depends_on = [

    data.intersight_hyperflex_cluster_profile.clusterprofileMoid,

  ]

}
