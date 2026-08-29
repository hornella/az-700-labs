variable "vm_username" {
  description = "The username for the virtual machine."
  type        = string
  default     = "TestUser"
}

variable "vm_password" {
  description = "The password for the virtual machine."
  type        = string
  sensitive   = true
}

variable "vm_size" {
  description = "The size of the virtual machine."
  type        = string
  default     = "Standard_D2s_v7"
}