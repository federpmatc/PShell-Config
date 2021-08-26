#The following script can be used to create bulk users in our itnet.pri domain 
#This will first create the OU stored in the $Path variable.

#Create 5 Users.ps1
#8/25/2021

#$DomainName set to your domain
$domainName = "ITNET.pri"

#$Path should be set to the distinguished name of the OU where users will be created
#The following will show Distinguished Names for all OUs

Get-ADOrganizationalUnit -Filter * | select-object name, distinguishedname

$path = "OU=TempEmployees,DC=ITNET,DC=pri"

#Returns $null if doesn't exist
if (Get-ADOrganizationalUnit -Filter "DistinguishedName -eq '$path'"){
Write-Host "The following OU - $path exists"
}
else {
New-ADOrganizationalUnit -Name "TempEmployees" -Path "DC=ITNET,DC=pri"
}

#$total should be set to how many users you want to create
$total=5

#The following block of code will get executed multiple times (or whatever the value of $total is set to.
1..$total |foreach { 
$userName = "Employee$_"
if (Get-ADUser -Filter "Name -eq '$userName'"){
    Write-Host "No need to create $username already exists"
}
else {
    Write-Host "Creating user $userName@$domainName.  User $_ of $total"
    New-ADUser -AccountPassword (ConvertTo-SecureString "Password01" -AsPlainText -Force) `
    -Name "$userName" `
    -Enabled $true `
    -Path $path `
    -SamAccountName "$userName" `
    -UserPrincipalName ($userName + "@" + $domainName)
}
}

Write-Host "Here are all of the users and OUs in your domain - $domainName"
Get-ADUser -Filter * | Select-Object Name, DistinguishedName
