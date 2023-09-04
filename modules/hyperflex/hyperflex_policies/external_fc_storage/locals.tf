locals {

  # Format cluster_profiles

  list_of_cluster_profiles_moid = [for cluster_profile in data.intersight_hyperflex_cluster_profile.clusterprofileMoid : cluster_profile.results[0].moid]

  list_of_cluster_profiles = [
    for cluster_profile_moid in local.list_of_cluster_profiles_moid :
    {
      moid                  = cluster_profile_moid
      class_id              = "mo.MoRef"
      object_type           = "hyperflex.ClusterProfile"
      selector              = ""
      additional_properties = ""
    }
  ]

}
