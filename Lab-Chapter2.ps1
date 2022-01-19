$seconds = 1..10
notepad.exe
$myShell = New-Object  -com   "Wscript.Shell"
foreach ($second in $seconds) {
    Start-Sleep -Seconds 1
    $myShell.sendkeys("!")
} 
