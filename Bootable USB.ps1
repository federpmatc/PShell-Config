#https://winaero.com/powershell-windows-10-bootable-usb/
$Results = Get-Disk | Where-Object BusType -eq USB | Out-GridView -Title 'Select USB Drive to Format' -OutputMode Single |
Clear-Disk -RemoveData -RemoveOEM -Confirm:$false -PassThru | New-Partition -UseMaximumSize -IsActive -AssignDriveLetter | Format-Volume -FileSystem exFAT

Mount-DiskImage -ImagePath "D:\ITNET Images\Labfiles\ITNET-110 (Windows 10)\ISOs\en_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12063379.iso"
#Returns letter of mounted image
$Mount= Get-CimInstance Win32_LogicalDisk | Where-Object{ $_.DriveType -eq 5 -and $_.Size -gt 0 } | select -ExpandProperty DeviceID

Set-Location -Path  "$Mount\Boot"

bootsect.exe /nt60 "$($Results.DriveLetter):"
Copy-Item -Path "$Mount\*" -Destination "$($Results.DriveLetter):" -Recurse -Verbose


