resource "proxmox_vm_qemu" "this" {
  vmid        = var.vm_id
  name        = var.vm_name
  vm_state    = var.vm_state
  target_node = var.proxmox_node
  onboot      = true
  agent       = 1
  bios        = "seabios"

  # CPU
  cpu {
    type    = "host"
    cores   = var.cpus
    sockets = 1
  }

  # Memory
  memory  = var.memory
  balloon = 0

  # Boot media
  boot   = "order=ide2;scsi0"
  scsihw = "virtio-scsi-single"


  # Root disk
  disks {
    ide {
      ide2 {
        cdrom {
          iso = "${var.storage_iso}:iso/${var.talos_iso}"
        }
      }
    }
    scsi {
      scsi0 {
        disk {
          size       = "${var.disk_gb}G"
          storage    = var.storage_vm
          discard    = true
          emulatessd = true
          iothread   = true
          cache      = "none"
        }
      }
    }

  }

  # NIC
  network {
    id     = 0
    model  = "virtio"
    bridge = var.bridge
    tag    = var.vlan_tag
  }

  # Optional NVMe PCI passthrough for workers (for Longhorn)
  dynamic "hostpci" {
    for_each = var.nvme_pci_addr == null ? [] : [var.nvme_pci_addr]
    content {
      host = hostpci.value
      pcie = 1
    }
  }

  tags = var.tags
}
