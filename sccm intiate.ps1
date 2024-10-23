remove-item -path "C:\Windows\System32\GroupPolicy\User\*" -Recurse -force;
Remove-Item -Path "C:\Windows\System32\GroupPolicy\Machine\*" -Recurse -Force;

Remove-Item –path C:\Windows\ccmcache\* –recurse -Force -ErrorAction SilentlyContinue
remove-item -Path C:\Windows\Prefetch\*  -Recurse -Force -ErrorAction SilentlyContinue;
remove-item "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue;
remove-item -Path C:\Windows\Temp\* -Recurse -Force -ErrorAction SilentlyContinue 

Stop-Service -Force winmgmt -ErrorAction SilentlyContinue
Stop-Service -Force wuauserv -ErrorAction SilentlyContinue
Stop-Service -Force cryptsvc -ErrorAction SilentlyContinue


	cd  C:\Windows\System32\catroot2\
   	del C:\Windows\System32\Wbem\oldcatroot2 -recurse -Force -ErrorAction SilentlyContinue
   	ren cartoot2 oldcatroot2 -ErrorAction SilentlyContinue
   
   	cd  C:\windows\SoftwareDistribution\
   	del C:\windows\SoftwareDistribution.old -recurse -Force -ErrorAction SilentlyContinue
   	ren SoftwareDistribution SoftwareDistribution.old -ErrorAction SilentlyContinue
   
   	cd  C:\Windows\System32\Wbem\
   	del C:\Windows\System32\Wbem\Repository.old -recurse -Force -ErrorAction SilentlyContinue
   	ren Repository Repository.old -ErrorAction SilentlyContinue

   Get-Service winmgmt | Where {$_.status –eq 'Stopped'} |  Start-Service -ErrorAction SilentlyContinue
   Get-Service wuauserv | Where {$_.status –eq 'Stopped'} |  Start-Service -ErrorAction SilentlyContinue
   Get-Service cryptsvc | Where {$_.status –eq 'Stopped'} |  Start-Service -ErrorAction SilentlyContinue
   Get-Service Netman | Where {$_.status –eq 'Stopped'} |  Start-Service -ErrorAction SilentlyContinue
   Get-Service netprofm | Where {$_.status –eq 'Stopped'} |  Start-Service -ErrorAction SilentlyContinue
   Get-Service BITS | Where {$_.status –eq 'Stopped'} |  Start-Service -ErrorAction SilentlyContinue

Invoke-WMIMethod -Namespace root\ccm -Class SMS_CLIENT -Name TriggerSchedule "{00000000-0000-0000-0000-000000000121}" -ErrorAction SilentlyContinue
Invoke-WMIMethod -Namespace root\ccm -Class SMS_CLIENT -Name TriggerSchedule "{00000000-0000-0000-0000-000000000003}" -ErrorAction SilentlyContinue
Invoke-WMIMethod -Namespace root\ccm -Class SMS_CLIENT -Name TriggerSchedule "{00000000-0000-0000-0000-000000000010}" -ErrorAction SilentlyContinue
Invoke-WMIMethod -Namespace root\ccm -Class SMS_CLIENT -Name TriggerSchedule "{00000000-0000-0000-0000-000000000001}" -ErrorAction SilentlyContinue
Invoke-WMIMethod -Namespace root\ccm -Class SMS_CLIENT -Name TriggerSchedule "{00000000-0000-0000-0000-000000000021}" -ErrorAction SilentlyContinue
Invoke-WMIMethod -Namespace root\ccm -Class SMS_CLIENT -Name TriggerSchedule "{00000000-0000-0000-0000-000000000022}" -ErrorAction SilentlyContinue
Invoke-WMIMethod -Namespace root\ccm -Class SMS_CLIENT -Name TriggerSchedule "{00000000-0000-0000-0000-000000000002}" -ErrorAction SilentlyContinue
Invoke-WMIMethod -Namespace root\ccm -Class SMS_CLIENT -Name TriggerSchedule "{00000000-0000-0000-0000-000000000031}" -ErrorAction SilentlyContinue
Invoke-WMIMethod -Namespace root\ccm -Class SMS_CLIENT -Name TriggerSchedule "{00000000-0000-0000-0000-000000000114}" -ErrorAction SilentlyContinue
Invoke-WMIMethod -Namespace root\ccm -Class SMS_CLIENT -Name TriggerSchedule "{00000000-0000-0000-0000-000000000113}" -ErrorAction SilentlyContinue
Invoke-WMIMethod -Namespace root\ccm -Class SMS_CLIENT -Name TriggerSchedule "{00000000-0000-0000-0000-000000000111}" -ErrorAction SilentlyContinue
Invoke-WMIMethod -Namespace root\ccm -Class SMS_CLIENT -Name TriggerSchedule "{00000000-0000-0000-0000-000000000026}" -ErrorAction SilentlyContinue
Invoke-WMIMethod -Namespace root\ccm -Class SMS_CLIENT -Name TriggerSchedule "{00000000-0000-0000-0000-000000000027}" -ErrorAction SilentlyContinue
Invoke-WMIMethod -Namespace root\ccm -Class SMS_CLIENT -Name TriggerSchedule "{00000000-0000-0000-0000-000000000032}" -ErrorAction SilentlyContinue

$l=0
$Baselines = Get-WmiObject -ComputerName $env:COMPUTERNAME -Namespace root\ccm\dcm -Class SMS_DesiredConfiguration
$excludebaseline = "CheckForPACFileRegistryEntry","WCM Informational Baseline V2","WCM Informational - GPO Update for Outlook"
while ($l -lt 4){
Write-Host "Baseline evaluation check $l" -ForegroundColor Gray
foreach ($Baseline in $Baselines) {
    if ($baseline.displayname -cnotin $excludebaseline){
                Write-host "Evaluate configuration baseline $($Baseline.DisplayName) " -ForegroundColor Magenta
                $Evaluation = ([wmiclass]"\\$env:COMPUTERNAME\root\ccm\dcm:SMS_DesiredConfiguration").TriggerEvaluation($Baseline.Name, $Baseline.Version)
            }
            }
Start-Sleep 30
$l++
}

Start-Process -FilePath powershell.exe -ArgumentList "gpupdate /force /wait:-1"
