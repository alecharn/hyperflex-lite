# A policy specifying the configuration to automatically generate support tickets with Cisco TAC.

resource "intersight_hyperflex_auto_support_policy" "autosupport_policy" {
  admin_state      = var.admin_state
  cluster_profiles = local.list_of_cluster_profiles
  description      = var.description
  name             = var.name
  organization {
    object_type = "organization.Organization"
    moid        = var.organization
  }
  service_ticket_receipient = var.service_ticket_recipient
  tags                      = var.tags

  depends_on = [

    data.intersight_hyperflex_cluster_profile.clusterprofileMoid,

  ]

}
