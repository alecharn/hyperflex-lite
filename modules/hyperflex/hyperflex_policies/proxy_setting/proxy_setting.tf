# A policy specifying the HTTP proxy settings to be used by the HyperFlex installation process and HyperFlex storage controller VMs. 
# This policy is required when the internet access of your servers including CIMC and HyperFlex storage controller VMs is secured by a HTTP proxy.

resource "intersight_hyperflex_proxy_setting_policy" "proxy_setting_policy" {
  cluster_profiles = local.list_of_cluster_profiles
  description      = var.description
  hostname         = var.hostname
  name             = var.name
  password         = var.password
  port             = var.port
  organization {
    object_type = "organization.Organization"
    moid        = var.organization
  }
  tags     = var.tags
  username = var.username

  depends_on = [

    data.intersight_hyperflex_cluster_profile.clusterprofileMoid,

  ]

}
