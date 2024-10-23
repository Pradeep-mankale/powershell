Stop-Process citrix*;
Stop-Process -ProcessName redirector;
Get-Package citrix* | Uninstall-Package -Force -ErrorAction Continue;
Start-Sleep -Seconds 60
takeown.exe /f 'C:\Program Files\citrix' /r /a  /d y;

takeown.exe /f "C:\Program Files (x86)\Citrix" /r /a  /d y;
takeown.exe /f "C:\ProgramData\Citrix" /r /a  /d y;
takeown.exe /f "$env:LOCALAPPDATA\citrix" /r /a  /d y;

Remove-Item -Path "C:\Program Files\citrix" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "C:\Program Files (x86)\Citrix" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item  -Path "$env:LOCALAPPDATA\citrix" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "HKCU:\Software\Citrix" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "C:\ProgramData\Citrix" -Recurse -Force -ErrorAction SilentlyContinue

remove-item -Path C:\Windows\Prefetch\*  -Recurse -Force -ErrorAction SilentlyContinue;
remove-item "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue;
remove-item -Path C:\Windows\Temp\* -Recurse -Force -ErrorAction SilentlyContinue 