New-LocalGroup -Name AvectoUsers -ErrorAction SilentlyContinue;
Add-LocalGroupMember -Group AvectoUsers -Member dir\$env:USERNAME;
lusrmgr