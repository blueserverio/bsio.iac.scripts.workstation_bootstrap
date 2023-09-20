#!powershell
#Requires -Version 3.0

# Get the ID and security principal of the current user account
$myWindowsID=[System.Security.Principal.WindowsIdentity]::GetCurrent()
$myWindowsPrincipal=new-object System.Security.Principal.WindowsPrincipal($myWindowsID)

# Get the security principal for the Administrator role
$adminRole=[System.Security.Principal.WindowsBuiltInRole]::Administrator

# Check to see if we are currently running "as Administrator"
if (-Not $myWindowsPrincipal.IsInRole($adminRole))
{
    Write-Host "ERROR: You need elevated Administrator privileges in order to run this script."
    Write-Host "       Start Windows PowerShell by using the Run as Administrator option."
    Exit 2
}

# Create new local Admin user for script purposes
$ansibleUser = Get-LocalUser -Name "ansible" -ErrorAction SilentlyContinue
if ($null -eq $ansibleUser){
    $Computer = [ADSI]"WinNT://$Env:COMPUTERNAME,Computer"

    $LocalAdmin = $Computer.Create("User", "ansible")
    $LocalAdmin.SetPassword("Password1!")
    $LocalAdmin.SetInfo()
    $LocalAdmin.FullName = "Local Ansible account by Powershell"
    $LocalAdmin.SetInfo()
    $LocalAdmin.UserFlags = 64 + 65536 # ADS_UF_PASSWD_CANT_CHANGE + ADS_UF_DONT_EXPIRE_PASSWD
    $LocalAdmin.SetInfo()

    $group = [ADSI]("WinNT://"+$env:COMPUTERNAME+"/administrators,group")
    $group.add("WinNT://ansible,user")

    Write-Host "PS Remoting User ('Ansible') has been successfully created."
}