
# Not installed? 
$wslStatus = Start-Process -FilePath wsl.exe -ArgumentList "--status" -Wait -PassThru
if ($wslStatus.ExitCode -eq 50){
	# Status came back with no status - no distro installed
	$wslInstall = Start-Process -FilePath wsl.exe -ArgumentList "--install -d Ubuntu --no-launch" -Wait -PassThru
	Restart-Computer -ComputerName localhost -Force
} elseif ($wslStatus.ExitCode -eq 0){
	# Install went fine. Check if Distro installed
	$wslList = Start-Process -FilePath wsl.exe -ArgumentList "--list" -Wait -PassThru
	if ($wslList.ExitCode -eq -1)
	{
		#Ubuntu Install hasn't been executed
		$ubuntuInstall = Start-Process -FilePath ubuntu.exe -Wait -PassThru
	} else {
		# Ubuntu has been run? 
	}
}

