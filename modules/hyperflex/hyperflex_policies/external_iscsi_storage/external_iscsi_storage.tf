# Policies specifying external storage connectivity information via Fabric attached FCoE storage
# *** not applicable to Edge / DC-no-FI cluster ***

resource "intersight_hyperflex_ext_iscsi_storage_policy" "external_iscsi_storage_policy" {
  admin_state      = var.admin_state
  cluster_profiles = local.list_of_cluster_profiles
  description      = var.description
  exta_traffic {
    name        = var.exta_traffic.name
    vlan_id     = var.exta_traffic.vlan_id
    object_type = "hyperflex.NamedVlan"
  }
  extb_traffic {
    name        = var.extb_traffic.name
    vlan_id     = var.extb_traffic.vlan_id
    object_type = "hyperflex.NamedVlan"
  }
  name = var.name
  organization {
    object_type = "organization.Organization"
    moid        = var.organization
  }
  tags = var.tags

  depends_on = [

    data.intersight_hyperflex_cluster_profile.clusterprofileMoid,

  ]

}
