#  Policies specifying external storage connectivity information via Fabric attached FC storage
# *** not applicable to Edge / DC-no-FI cluster ***

resource "intersight_hyperflex_ext_fc_storage_policy" "external_fc_storage_policy" {
  admin_state      = var.admin_state
  cluster_profiles = local.list_of_cluster_profiles
  description      = var.description
  exta_traffic {
    name        = var.exta_traffic.name
    vsan_id     = var.exta_traffic.vsan_id
    object_type = "hyperflex.NamedVsan"
  }
  extb_traffic {
    name        = var.extb_traffic.name
    vsan_id     = var.extb_traffic.vsan_id
    object_type = "hyperflex.NamedVsan"
  }
  name = var.name
  organization {
    object_type = "organization.Organization"
    moid        = var.organization
  }
  tags = var.tags
  wwxn_prefix_range {
    end_addr    = var.wwxn_prefix_range.end_address
    object_type = "hyperflex.WwxnPrefixRange"
    start_addr  = var.wwxn_prefix_range.start_address
  }

  depends_on = [

    data.intersight_hyperflex_cluster_profile.clusterprofileMoid,

  ]

}
