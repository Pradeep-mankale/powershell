
($u = Get-WMIObject -class Win32_ComputerSystem | select username)

New-LocalGroup -Name AvectoUsers -ErrorAction SilentlyContinue;
Add-LocalGroupMember -Group AvectoUsers -Member $u;
lusrmgr