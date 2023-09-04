output "intersight_organization_moid" {
  description = "Moid of the Intersight organization."
  value       = data.intersight_organization_organization.organizationMoid.results[0].moid
}
