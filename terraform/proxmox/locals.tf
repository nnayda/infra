locals {
  # Set defaults
  vm_state      = "running"
  cpus          = 4
  memory        = 8192
  tags          = "k8s,worker"
  storage_iso   = "local"
  storage_vm    = "local-lvm"
  talos_iso     = "talos-qemu-tailscale-amd64.iso"
  disk_gb       = 40
  bridge        = "vmbr0"
  role          = "worker"
  vlan_tag      = null
  nvme_pci_addr = null

  nodes = {
    # PVE02
    "talos-ctl-1" = {
      proxmox_node = "pve02"
      vm_id        = 200
      tags         = "k8s,control"
      role         = "control"
    }
    "talos-ctl-2" = {
      proxmox_node = "pve02"
      vm_id        = 201
      tags         = "k8s,control"
      role         = "control"
    }
    "talos-ctl-3" = {
      proxmox_node = "pve02"
      vm_id        = 202
      tags         = "k8s,control"
      role         = "control"
    }
    "talos-wrk-1" = {
      proxmox_node = "pve02"
      vm_id        = 203
    }
  }
}