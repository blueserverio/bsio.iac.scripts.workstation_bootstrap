# BSIO IaC - Workstation Bootstrap Scripts

## Overview

This repository contains PowerShell scripts to bootstrap a developer workstation, ensuring it's prepared with essential tools like VSCode, Git, and Ansible.

##### **Note**:

This repository is a subset of the larger BlueServer.io Infrastructure as Code project. For a comprehensive understanding and to get started with the overarching project, please refer to the [main project README](https://github.com/blueserverio/bsio.iac.provision_environment/blob/main/README.md).


## Features

- Automatic provisioning using PowerShell.
- Step-by-step guide for manual setup.

## Usage

### Automated

Run the following command in an elevated PowerShell prompt:
```powershell
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/blueserverio/bsio.iac.scripts.workstation_bootstrap/main/bootstrap.ps1'))
```

If you do not have WSL installed, your system will **Reboot**.  When the workstation comes back up, execute the same command again to finish the WSL install. 

Once complete, launch wsl from an elevated Windows Terminal:
```
wsl
```

Follow the steps outlined in the [Provision Environment Development Guide](https://github.com/blueserverio/bsio.iac.provision_environment/blob/main/DEVELOPMENT.md) to continue with the provision process.

### Manual
1. Install [Chocolatey](https://chocolatey.org/).
2. Install [Git](https://git-scm.com/).
3. Install [VSCode](https://code.visualstudio.com/).
4. Install [Google Chrome](https://www.google.com/chrome/dr/download/).
5. Create a local Windows user named `ansible` with the password `Password1!` (this is a temporary password and will be changed with the subsequent playbooks.) Make this user a member of the `Administrators` Local Group. (this is a temporary membership and will be removed with the subsequent playbooks.)
6. Install and Configure Windows Remote Management ([Microsoft Documentation](https://learn.microsoft.com/en-us/windows/win32/winrm/installation-and-configuration-for-windows-remote-management))
7. Install and Configure Windows Subsystem for Linux - Version 2.  ([Microsoft Documentation](https://learn.microsoft.com/en-us/windows/wsl/install)) - Please note, you will be prompted with both the PowerShell script and manual install to **reboot** the workstation.  This is **required** for WSL to work properly.  
8. Launch WSL (`wsl` at a command prompt should work)
9. Update apt inside WSL by exeucting: `sudo apt update -y` 
10. Upgrade apt inside WSL packages by executing: `sudo apt upgrade -y`
11. Install Ansible inside WSL by executing the following:
    a. `sudo apt install software-properties-common`
    b. `sudo add-apt-repository --yes --update ppa:ansible/ansible`
    c. `sudo apt install ansible -y`

## Tools Installed
- [Chocolatey](https://chocolatey.org/)
- [Git](https://git-scm.com/)
- [VSCode](https://code.visualstudio.com/)
- [Google Chrome](https://www.google.com/chrome/dr/download/)
- [Ansible](https://www.ansible.com/)

## Contributing
Your contributions are always welcome! If you're looking to contribute to our project, please first read our [CONTRIBUTING guidelines](https://github.com/blueserverio/bsio.iac.provision_environment/blob/main/CONTRIBUTING.md). We look forward to working together to improve and expand the project.


## License
This project is licensed under the [MIT License](LICENSE).
