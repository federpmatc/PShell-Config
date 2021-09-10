#Disable firewall on Server2019-1 & Server2019-2
#This requires launching PowerShell with Administrative privileges
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False

#Chapter 9, Question 3
#There seems to be a problem with piping objects into Get-HotFix.  The following provides two alternate solutions
get-adcomputer -filter  {name -like 'Server2019*' }  | foreach {Get-HotFix -ComputerName $_.name}

$names = get-adcomputer -filter  {name -like 'Server2019*' } | Select-Object -expandproperty name
Get-HotFix -ComputerName $names
