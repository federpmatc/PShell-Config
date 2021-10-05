#Task 1
New-ADOrganizationalUnit -Path "dc=ITNET,dc=pri” -Name "IT Network Specialist" 
New-ADOrganizationalUnit -Path “ou=IT Network Specialist,dc=ITNET,dc=pri" -Name "Staff"
New-ADOrganizationalUnit -Path “ou=IT Network Specialist,dc=ITNET,dc=pri" -Name "Students"
New-ADOrganizationalUnit -Path "dc=ITNET,dc=pri” -Name "IT Support"

New-ADUser -SamAccountName “SeanG” -Name “Sean G” -GivenName “Sean” -Surname “G” -Path “ou=Staff,ou=IT Network specialist,dc=ITNET,dc=pri” -AccountPassword (ConvertTo-SecureString Password01 -AsPlainText -force) -PasswordNeverExpires $true -Enabled $true

#Task 2

Notepad C:\PowerShell\Users.csv
Import-Csv C:\Powershell\users.csv
import-csv C:\PowerShell\users.csv | Foreach {New-ADUser -SamAccountName $_.samAccountName -Name $_.name -GivenName $_.givenName -Surname $_.surname -Path $_.path -AccountPassword (ConvertTo-SecureString $_.Password -AsPlainText -force) -PasswordNeverExpires $true -Enabled $true} 

#Task 4
NEW-ADGroup -name "IT Network Specialist - Staff" -groupscope Global -path "OU=Staff,OU=IT Network Specialist,DC=ITNET,DC=pri"
NEW-ADGroup -name "IT Network Specialist - Students" -groupscope Global -path "OU=Students,OU=IT Network Specialist,DC=ITNET,DC=pri"
NEW-ADGroup -name "IT Support - Staff" -groupscope Global -path "OU=IT Support,DC=ITNET,DC=pri"

import-csv C:\PowerShell\Users.csv | Foreach-Object {add-adgroupmember -identity $_.group -members $_.name}

#Task 5
Get-ADUser

Get-ADUSer Administrator -Properties *

Get-AdUser BrianK -Properties PasswordExpired, PasswordLastSet, PasswordNeverExpires, PasswordNotRequired

#The pipe at the end of a line tells powershell that command continues on the follow line
Get-AdUser -Filter * -Properties PasswordExpired, PasswordLastSet, PasswordNeverExpires, PasswordNotRequired | 
Format-Table Name, PasswordExpired, PasswordLastSet, PasswordNeverExpires, PasswordNotRequired

Get-AdUser -Filter * -Properties PasswordExpired, PasswordLastSet, PasswordNeverExpires, PasswordNotRequired | 
Format-Table Name, PasswordExpired, PasswordLastSet, PasswordNeverExpires, PasswordNotRequired |
Out-File C:\PowerShell\UserPasswordInfo.txt

