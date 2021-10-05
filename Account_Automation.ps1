
#Task 1
New-ADUser -SamAccountName “SeanG” -Name “Sean G” -GivenName “Sean” -Surname “G” -Path “ou=Staff,ou=IT Network specialist,dc=ITNET,dc=pri” -AccountPassword (ConvertTo-SecureString Password01 -AsPlainText -force) -PasswordNeverExpires $true -Enabled $true

#Task 2
https://drive.google.com/open?id=0B7aOXOfOltnbbVZJaW0teEZjZDg

$CSV = '
name,path,givenName,surname,samAcountName,userPrincipalName,displayName,Password,group
PatF,"OU=Students,OU=IT Network Specialist,DC=ITNET-112,DC=pri",Pat,F,PatF,PatF@ITNET-112.com,PatF,Password01,IT Network Specialist - Students
BrianK,"OU=Staff,OU=IT Network Specialist,DC=ITNET-112,DC=pri",Brian,K,BrianK,BrianK@ITNET-112.com,BrianK,Password01,IT Network Specialist - Staff
SueK,"OU=Staff,OU=IT Network Specialist,DC=ITNET-112,DC=pri",Sue,K,SueK,SueK@ITNET-112.com,SueK,Password01,IT Network Specialist - Staff
SteveW,"OU=IT Support,DC=ITNET-112,DC=pri",Steve,W,SteveW,SteveW@ITNET-112.com,SteveW,Password01,IT Support - Staff
LayneD,"OU=Staff,OU=IT Network Specialist,DC=ITNET-112,DC=pri",Layne,D,LayneD,LayneD@ITNET-112.com,LayneD,Password01,IT Network Specialist - Staff
SeanG,"OU=Students,OU=IT Network Specialist,DC=ITNET-112,DC=pri",Sean,G,SeanG,SeanG@ITNET-112.com,SeanG,Password01,IT Network Specialist - Students
'
