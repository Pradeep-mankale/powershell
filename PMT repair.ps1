stop-process -ProcessName Protect* -force
stop-service ProtectMyTechWinService
Start-Sleep -Seconds 10;
Remove-Item -Path "$env:LOCALAPPDATA\Accenture\ProtectMyTech\*" -Recurse -force
Start-Sleep -Seconds 20
Start-Process  "C:\ProgramData\Accenture\ProtectMyTech\ProtectMyTech.exe"