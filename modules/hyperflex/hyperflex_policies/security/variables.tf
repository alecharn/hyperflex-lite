variable "attached_to_cluster_profiles" {
  description = <<-EOT
  Cluster Profiles to which the policy is attached.

  Default is [], meaning no Cluster Profile is attached to the policy.

  It is a list of objects with the following variable:
  - cluster_profile: reference to the name of the Cluster Profile.
  EOT
  type = list(object(
    {
      cluster_profile = optional(string)
    }
  ))
}

variable "description" {
  description = "Security policy description."
  type        = string
}

variable "factory_hypervisor_password" {
  description = <<-EOT
  Indicates if Hypervisor password is the factory set default password. 
  For HyperFlex Data Platform versions 3.0 or higher, enable this if the default password was not changed on the Hypervisor. 
  It is required to supply a new custom Hypervisor password that will be applied to the Hypervisor during deployment. 
  For HyperFlex Data Platform versions prior to 3.0 release, this setting has no effect and the default password will be used for initial install. 
  The Hypervisor password should be changed after deployment.
  EOT
  type        = bool
}

variable "hxdp_root_pwd" {
  description = <<-EOT
  HyperFlex storage controller VM password.
  Must contain a minimum of 10 characters, with at least 1 lowercase, 1 uppercase, 1 numeric, and 1 of these -_@#$%^&*! special characters.
  EOT
  type        = string
}

variable "hypervisor_admin" {
  description = "Hypervisor administrator username must contain only alphanumeric characters."
  type        = string
}

variable "hypervisor_admin_pwd" {
  description = <<-EOT
  The Hypervisor root password. 
  For HyperFlex Data Platform 3.0 or later, if the factory default password was not manually changed, you must set a new custom password. 
  If the password was manually changed, you must not enable the factory default password property and provide the current hypervisor password. 
  Note - All HyperFlex nodes require the same hypervisor password for installation. 
  For HyperFlex Data Platform prior to 3.0, use the default password Cisco123 for newly manufactured HyperFlex servers. 
  A custom password should only be entered if hypervisor credentials were manually changed prior to deployment.
  EOT
  type        = string
}

variable "name" {
  description = "Security policy name."
  type        = string
}

variable "organization" {
  description = "Organization of the policy."
  type        = string
}

variable "tags" {
  description = "Tags of the policy."
  type        = list(map(string))
}
