# Read Moid of the cluster profiles attached to the policy

data "intersight_hyperflex_cluster_profile" "clusterprofileMoid" {

  for_each = var.attached_to_cluster_profiles != null ? { for cluster_profile in var.attached_to_cluster_profiles : cluster_profile.cluster_profile => cluster_profile } : {}

  name = each.value.cluster_profile

}
