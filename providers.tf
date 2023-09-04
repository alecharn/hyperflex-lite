# Intersight Provider
# https://registry.terraform.io/providers/CiscoDevNet/intersight/latest

terraform {
  required_providers {
    intersight = {
      source  = "CiscoDevNet/intersight"
      version = ">=1.0.31"
    }
  }
}


# Intersight Provider Settings

provider "intersight" {
  apikey    = var.intersight_api_key_id
  endpoint  = var.intersight_endpoint
  secretkey = var.intersight_api_secret_key
}
