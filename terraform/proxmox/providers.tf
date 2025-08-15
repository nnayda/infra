terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.2-rc03"
    }
    sops = {
      source  = "carlpett/sops"
      version = "1.2.1"
    }
  }
}

# Read SOPS Encrypted File
data "sops_file" "secrets" {
  source_file = "./secrets.sops.yaml"
}

# Proxmox Provider
provider "proxmox" {
  pm_api_url                  = data.sops_file.secrets.data["proxmox.endpoint"]
  pm_api_token_id             = data.sops_file.secrets.data["proxmox.api_token"]
  pm_api_token_secret         = data.sops_file.secrets.data["proxmox.api_token_secret"]
  pm_tls_insecure             = true
  pm_parallel                 = 1
  pm_timeout                  = 600
  pm_minimum_permission_check = false
}
