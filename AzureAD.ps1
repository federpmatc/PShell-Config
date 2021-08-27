Install-Module -Name AzureAd
Get-Command -Module AzureAD
Get-AzureADUser

$cred = Get-Credential -UserName "federp@itnet123.onmicrosoft.com" -Message "Enter password"

Connect-AzureAD -Credential $cred
Get-AzureADUser -All $true 
Get-AzureADUser -Filter "userprincipalname eq 'federp@itnet123.onmicrosoft.com'" 
Get-AzureADUser -Filter "DisplayName eq 'Pat feder'" 
Get-AzureADGroup -All $true | Where-Object DisplayName -eq "TestGroup2" | Get-AzureADGroupMember
 
Get-AzureADGroup -SearchString testGroup2 | Get-AzureADGroupMember 


$GARole = Get-AzureADDirectoryRole -Filter "DisplayName eq 'Global Administrator'"
Get-AzureADDirectoryRoleMember -ObjectId $GARole.ObjectId



