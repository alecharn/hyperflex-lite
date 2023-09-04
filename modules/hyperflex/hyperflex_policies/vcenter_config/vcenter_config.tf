# A policy specifying vCenter configuration.

resource "intersight_hyperflex_vcenter_config_policy" "vcenter_config_policy" {
  cluster_profiles = local.list_of_cluster_profiles
  data_center      = var.data_center
  description      = var.description
  hostname         = var.hostname
  name             = var.name
  organization {
    object_type = "organization.Organization"
    moid        = var.organization
  }
  password = var.password
  tags     = var.tags
  username = var.username

  depends_on = [

    data.intersight_hyperflex_cluster_profile.clusterprofileMoid,

  ]

}
