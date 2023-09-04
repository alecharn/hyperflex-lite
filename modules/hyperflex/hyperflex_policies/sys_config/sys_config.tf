# A policy specifying system configuration such as timezone, DNS servers, and NTP Servers.

resource "intersight_hyperflex_sys_config_policy" "sys_config_policy" {
  cluster_profiles = local.list_of_cluster_profiles
  description      = var.description
  dns_domain_name  = var.dns_domain_name
  dns_servers      = var.dns_servers
  name             = var.name
  ntp_servers      = var.ntp_servers
  organization {
    object_type = "organization.Organization"
    moid        = var.organization
  }
  tags     = var.tags
  timezone = var.timezone

  depends_on = [

    data.intersight_hyperflex_cluster_profile.clusterprofileMoid,

  ]

}
