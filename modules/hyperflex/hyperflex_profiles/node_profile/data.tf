# Read Moid of the physical server that will be attached to the cluster profile

data "intersight_compute_physical_summary" "serverMoid" {
  name = var.server_name
}


# Read Moid of the cluster profile attached to the node profile

data "intersight_hyperflex_cluster_profile" "clusterMoid" {
  name = var.attached_to_hx_cluster
}
