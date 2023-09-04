output "name" {
  description = "Software Version policy name."
  value       = intersight_hyperflex_software_version_policy.software_version_policy.name
}

output "tags" {
  value = var.tags
}
