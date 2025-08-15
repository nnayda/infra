# Bootstrapping a Proxmox Node

This guide provides details related to adding a new Proxmox node to the cluster
and bootstrapping it to get started.

## Setting up Proxmox
1. Install Proxmox on the node using the [ISO](https://www.proxmox.com/en/downloads/proxmox-virtual-environment/iso).
2. Set up link aggregation (optional)
    - Use the proxmox GUI to configure the network interfaces and set up link aggregation
    - Create a linux bond `bond0`, and list the NICs as slaves (`eno1 enp82s0`),
    use `LACP (802.3ad)` for the bond mode, and `layer3+4` for the hash policy.`
    - Create a linux bridge `vmbr0`, configure the IP, and set the bridge port to the bond (`bond0`). (optional: make it VLAN aware)
    - Apply the configuration, if everything comes up correctly, set link aggregation
    on the router.
3. Run the post-install script on the node:
    ```bash
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/tools/pve/post-pve-install.sh)"
    ```
4. Add the proxmox node details to the ansible inventory, host_vars, and group_vars (if necessary).
5. Run the setup:host task so that we can use ansible to configure Proxmox. Adjust
    `HOST` and `USER` accordingly.
    ```bash
    task setup:host HOST=pve02 USER=root
    ```
6. Run the setup:proxmox task so that we can use terraform to provision VMs.
    ```bash
    task setup:proxmox
    ```
