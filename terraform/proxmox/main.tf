module "talos_vm" {
  for_each = local.nodes
  source   = "./modules/talos_vm"

  proxmox_node  = each.value.proxmox_node
  vm_name       = each.key
  vm_id         = each.value.vm_id
  vm_state      = lookup(each.value, "vm_state", local.vm_state)
  cpus          = lookup(each.value, "cpus", local.cpus)
  memory        = lookup(each.value, "memory", local.memory)
  storage_iso   = lookup(each.value, "storage_iso", local.storage_iso)
  talos_iso     = lookup(each.value, "talos_iso", local.talos_iso)
  storage_vm    = lookup(each.value, "storage_vm", local.storage_vm)
  disk_gb       = lookup(each.value, "disk_gb", local.disk_gb)
  bridge        = lookup(each.value, "bridge", local.bridge)
  vlan_tag      = lookup(each.value, "vlan_tag", local.vlan_tag)
  tags          = lookup(each.value, "tags", local.tags)
  nvme_pci_addr = lookup(each.value, "nvme_pci_addr", local.nvme_pci_addr)

  providers = {
    proxmox = proxmox
  }
}
