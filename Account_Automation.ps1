
#Task 1
New-ADOrganizationalUnit -Path "dc=ITNET,dc=pri” -Name "IT Network Specialist"
New-ADOrganizationalUnit -Path “ou=IT Network Specialist,dc=ITNET,dc=pri" -Name "Staff"
New-ADOrganizationalUnit -Path “ou=IT Network Specialist,dc=ITNET,dc=pri" -Name "Students"
New-ADOrganizationalUnit -Path "dc=ITNET,dc=pri” -Name "IT Support"

New-ADUser -SamAccountName “SeanG” -Name “Sean G” -GivenName “Sean” -Surname “G” -Path “ou=Staff,ou=IT Network specialist,dc=ITNET,dc=pri” -AccountPassword (ConvertTo-SecureString Password01 -AsPlainText -force) -PasswordNeverExpires $true -Enabled $true

#Task 2
Notepad C:\PowerShell\Users.csv
import-csv C:\PowerShell\users.csv
import-csv C:\PowerShell\users.csv | Foreach {New-ADUser -SamAccountName $_.samAccountName -Name $_.name -GivenName $_.givenName -Surname $_.surname -Path $_.path -AccountPassword (ConvertTo-SecureString $_.Password -AsPlainText -force) -PasswordNeverExpires $true -Enabled $true} 

