# A configuration profile per node in the HyperFlex cluster. 
# It defines node settings such as IP address configuration for hypervisor management network, storage data network, HyperFlex management network, and the assigned physical server.

resource "intersight_hyperflex_node_profile" "node_profile" {
  assigned_server {
    moid        = data.intersight_compute_physical_summary.serverMoid.results[0].moid
    object_type = "compute.RackUnit"
  }
  cluster_profile {
    moid        = data.intersight_hyperflex_cluster_profile.clusterMoid.results[0].moid
    object_type = "hyperflex.ClusterProfile"
  }
  description            = var.description
  hxdp_data_ip           = var.hxdp_data_ip
  hxdp_mgmt_ip           = var.server_hxdp_mgmt_ip
  hxdp_storage_client_ip = var.hxdp_storage_client_ip
  hypervisor_data_ip     = var.hypervisor_data_ip
  hypervisor_mgmt_ip     = var.server_hypervisor_mgmt_ip
  name                   = var.server_hypervisor_hostname
  node_role              = var.node_role
  tags                   = var.tags
}
