stop-process -ProcessName Protect* -force
stop-service ProtectMyTechWinService
Start-Sleep -Seconds 10;
start-process "C:\ProgramData\Accenture\ProtectMyTech\unins000.exe" /SILENT -Wait
Remove-Item -Path "$env:LOCALAPPDATA\Accenture\ProtectMyTech" -Recurse -Force
Remove-Item -Path "C:\Program Files\Accenture\PMTServiceFiles"  -Recurse -Force
Remove-Item -Path "C:\Windows\Temp\*"  -Recurse -Force
Remove-Item -Path "$env:temp\*" -Recurse -Force
