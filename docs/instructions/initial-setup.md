# Initial Setup Steps

## Prerequisites

| Name | Description |
|------|-------------|
| [Homebrew](https://brew.sh/) | Package manager for macOS and Linux. |


## Installation Steps
1. Install all dependencies using tasks. This will install all brew 
dependencies, python dependencies, and ansible dependencies.
    ```bash
    task setup
    ```
2. Create an [age](https://github.com/FiloSottile/age) key.
    ```bash
    mkdir - p "~/Library/Application Support/sops/age"
    age-keygen -o "~/Library/Application Support/sops/age/keys.txt"
    ```
    Read [here](https://github.com/getsops/sops?tab=readme-ov-file#encrypting-using-age) 
    for further details on where to store the generated key depending on your system.
3. Add your public key to the `.sops.yaml` file.
4. Create an SSH key to use for the nodes
    ```bash
    ssh-keygen -t rsa -b 4096 -f ~/.ssh/ansible
    ```