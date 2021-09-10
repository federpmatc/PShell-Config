#Chapter 9, Question 3
get-adcomputer -filter  {name -like '*Server*' } | Select-Object -property @{l='computername';e={$_.name}} | Get-Hotfix

Get-Hotfix -computername Server2019-1,Server2019-2
