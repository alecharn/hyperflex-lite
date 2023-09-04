# A policy capturing software versions for different HyperFlex Cluster compatible components that the user wishes to apply on the HyperFlex cluster.

resource "intersight_hyperflex_software_version_policy" "software_version_policy" {
  cluster_profiles   = local.list_of_cluster_profiles
  description        = var.description
  hxdp_version       = var.hxdp_version
  hypervisor_version = var.hypervisor_version
  name               = var.name
  organization {
    object_type = "organization.Organization"
    moid        = var.organization
  }
  server_firmware_version = var.server_firmware_version
  tags                    = var.tags

  depends_on = [

    data.intersight_hyperflex_cluster_profile.clusterprofileMoid,

  ]

}
