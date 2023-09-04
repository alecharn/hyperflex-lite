variable "attached_to_hx_cluster" {
  description = "Name of the HyperFlex cluster to whom the Node Profile is attached."
  type        = string
}

variable "description" {
  description = "Node Profile description."
  type        = string
}

variable "hxdp_data_ip" {
  description = "IP address for storage data network (Controller VM interface)."
  type        = string
}

variable "hxdp_storage_client_ip" {
  description = " IP address for storage client network (Controller VM interface)."
  type        = string
}

variable "hypervisor_data_ip" {
  description = "IP address for storage data network (Hypervisor interface)."
  type        = string
}

variable "node_role" {
  description = <<-EOT
  The role that this node performs in the HyperFlex cluster.
  * Unknown - The node role is not available.
  * Storage - The node persists data and contributes to the storage capacity of a cluster.
  * Compute - The node contributes to the compute capacity of a cluster.
  EOT
  type        = string
}

variable "server_hxdp_mgmt_ip" {
  description = "IP address for HyperFlex Controller VM of the node."
  type        = string
}

variable "server_hypervisor_mgmt_ip" {
  description = "IP address for hypervisor of the node."
  type        = string
}

variable "server_hypervisor_hostname" {
  description = "Hostname of the server and name of the Node Profile instance."
  type        = string
}

variable "server_name" {
  description = "Intersight or CIMC name of the server."
  type        = string
}

variable "tags" {
  description = "Tags of the policy."
  type        = list(map(string))
}
