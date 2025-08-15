variable "proxmox_node" {
  description = "Target Proxmox node name"
  type        = string
  default     = "pve"
}

variable "vm_name" {
  description = "The name for the VM"
  type        = string
  default     = "vm"
}

variable "vm_id" {
  type = number
}

variable "vm_state" {
  type    = string
  default = "running" # stopped, started
}

variable "role" {
  description = "Control Plane or Woker"
  type        = string # controlplane | worker
  default     = "worker"
}

variable "storage_iso" {
  description = "ISO storage name (Talos ISO uploaded here)"
  type        = string
  default     = "local"
}

variable "storage_vm" {
  description = "VM disk storage (e.g., local-lvm)"
  type        = string
  default     = "local-lvm"
}

variable "talos_iso" {
  description = "Talos ISO filename"
  type        = string
  default     = "talos-qemu-tailscale-amd64.iso"
}

variable "cpus" {
  type    = number
  default = 4
}

variable "memory" {
  type    = number
  default = 8192
}

variable "disk_gb" {
  type    = number
  default = 40
}

variable "vlan_tag" {
  type    = number
  default = null
}

variable "tags" {
  type    = string
  default = "k8s"
}

variable "bridge" {
  description = "Proxmox bridge to attach NICs"
  type        = string
  default     = "vmbr0"
}

variable "nvme_pci_addr" {
  description = "Proxmox bridge to attach NICs"
  type        = list(string)
  default     = null
}