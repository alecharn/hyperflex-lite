# Policies specifying HyperFlex cluster storage settings

resource "intersight_hyperflex_cluster_storage_policy" "cluster_storage_policy" {
  description            = var.description
  disk_partition_cleanup = var.disk_partition_cleanup
  cluster_profiles       = local.list_of_cluster_profiles
  logical_avalability_zone_config {
    auto_config = var.logical_availability_zone_config
    object_type = "hyperflex.LogicalAvailabilityZone"
  }
  name = var.name
  organization {
    object_type = "organization.Organization"
    moid        = var.organization
  }
  tags             = var.tags
  vdi_optimization = var.vdi_optimization

  depends_on = [

    data.intersight_hyperflex_cluster_profile.clusterprofileMoid,

  ]

}
