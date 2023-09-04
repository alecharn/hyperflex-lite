locals {

  # Reading YAML data files
  model_hyperflex_policies = yamldecode(file("./data/intersight_hyperflex_policies.yaml"))
  model_hyperflex_profiles = yamldecode(file("./data/intersight_hyperflex_profiles.yaml"))


  # Format tags
  tags = [
    for tag_key, tag_value in var.tags :
    {
      additional_properties = ""
      key                   = tag_value.key
      value                 = tag_value.value
    }
  ]

}
