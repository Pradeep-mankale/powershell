Set-Location "C:\windows\Downloaded Program Files";
Start-Process -FilePath "PulseSetupClientCtrlUninstaller64.exe" -ErrorAction Continue;
start-sleep -Seconds 15;
Start-Process -FilePath "PulseSetupClientCtrlUninstaller.exe" -ErrorAction SilentlyContinue;
Start-Sleep -Seconds 30;

Set-Location -Path $env:APPDATA;
Start-Process "Pulse Secure\Host Checker\uninstall.exe" -ErrorAction SilentlyContinue;
Start-Sleep -Seconds 30;

start-process Start-Process "Pulse Secure\Setup Client\uninstall.exe" -ErrorAction SilentlyContinue;
Start-Sleep -Seconds 30;

Get-Package pulse* | Uninstall-Package -Force -ErrorAction Continue;
start-sleep -Seconds 200

Remove-Item -Path "C:\Program Files\pulse*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "C:\Program Files (x86)\pulse*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "C:\ProgramData\pulse*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "$env:LOCALAPPDATA\pulse*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "$env:APPDATA\pulse*" -Recurse -Force -ErrorAction SilentlyContinue

remove-item -Path C:\Windows\Prefetch\*  -Recurse -Force -ErrorAction SilentlyContinue;
remove-item "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue;
remove-item -Path C:\Windows\Temp\* -Recurse -Force -ErrorAction SilentlyContinue
