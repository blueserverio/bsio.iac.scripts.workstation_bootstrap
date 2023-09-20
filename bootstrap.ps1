#!powershell
#Requires -Version 3.0

# Install Chololatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install Git
choco install git -y

# Install VSCode
choco install vscode -y

# Install Google Chrome
choco install googlechrome -y --ignore-checksums

# Create the Ansible User
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/blueserverio/bsio.iac.scripts.workstation_bootstrap/main/scripts/CreateAnsibleUser.ps1'))

# Setup WinRM
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/blueserverio/bsio.iac.scripts.workstation_bootstrap/main/scripts/SetupWinRMForAnsible.ps1'))

# Install WSL
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/blueserverio/bsio.iac.scripts.workstation_bootstrap/main/scripts/InstallWSL.ps1'))

# Update WSL
wsl -u root -e sudo apt update -y

# Upgrade WSL
wsl -u root -e sudo apt upgrade -y

# Install Ansible
wsl -u root -e sudo apt install software-properties-common
wsl -u root -e sudo add-apt-repository --yes --update ppa:ansible/ansible
wsl -u root -e sudo apt install ansible -y