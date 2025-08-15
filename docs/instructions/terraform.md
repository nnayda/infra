# Provisioning with Terraform

This guide provides details on how to use Terraform to provision VMs
on our Proxmox nodes.

## Prerequisites
1. Ensure you have all dependencies installed.
    ```bash
    task setup
    ```
2. Initialize Terraform:
    ```bash
    cd terraform/proxmox
    tofu init
    ```
3. Ensure the ISO file has been uploaded to Proxmox. You can get the ISO [here](https://factory.talos.dev/).

## Provision
1. Edit the configuration specified in [locals](/terraform/proxmox/locals.tf).
2. Run tofu plan to check the proposed changes.
    ```bash
    tofu plan
    ```
3. If everything looks ok, apply changes.
    ```bash
    tofu apply
    ```
