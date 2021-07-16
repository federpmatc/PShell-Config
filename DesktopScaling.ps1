#https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/dpi-related-apis-and-registry-settings#scalingmode
#Change desktop scaling
$scale = 225
Write-Host "Changing desktop scaling to $scale%"
Start-Sleep -Seconds 2

$LogPixel = $Scale * 96/100
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
Set-Location 'HKCU:\Control Panel\Desktop'
Set-ItemProperty -Path . -Name Win8DpiScaling -Value 1
#Scale monitor to 100%
# 120 125%; 144 150%; 192 200%; 217 about 225%
Set-Location 'HKCU:\Control Panel\Desktop'
Set-ItemProperty -Path . -Name LogPixels -Value $LogPixel
Restart-Computer -Force
