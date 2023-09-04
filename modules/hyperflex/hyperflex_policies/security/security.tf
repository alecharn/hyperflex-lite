# A policy specifying credentials for HyperFlex cluster such as controller VM password, hypervisor username, and password.

resource "intersight_hyperflex_local_credential_policy" "security_policy" {
  cluster_profiles            = local.list_of_cluster_profiles
  description                 = var.description
  factory_hypervisor_password = var.factory_hypervisor_password
  hxdp_root_pwd               = var.hxdp_root_pwd
  hypervisor_admin            = var.hypervisor_admin
  hypervisor_admin_pwd        = var.hypervisor_admin_pwd
  name                        = var.name
  organization {
    object_type = "organization.Organization"
    moid        = var.organization
  }
  tags = var.tags

  depends_on = [

    data.intersight_hyperflex_cluster_profile.clusterprofileMoid,

  ]

}
