variable "azure_location" {
  type        = string
  default     = "japaneast"
  description = "Azure location for all resources"
}

variable "virtual_machines" {
  default     = {}
  description = "Create a virtual machine from CAF module"
}
variable "resource_groups" {
  default = {}
}
variable "vnets" {
  default = {}
}
variable "public_ip_addresses" {
  default = {}
}
variable "keyvaults" {
  default = {}
}
variable "global_settings" {
  default = {}
}