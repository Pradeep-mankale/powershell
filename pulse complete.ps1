Start-Process -FilePath "C:\Program Files (x86)\Pulse Secure\Pulse\PulseUninstall.exe" -ErrorAction SilentlyContinue
Start-Process -FilePath "C:\windows\Downloaded Program Files\PulseSetupClientCtrlUninstaller.exe" -ErrorAction SilentlyContinue
Start-Process -FilePath "$env:APPDATA\Pulse Secure\Setup Client\uninstall.exe" -ErrorAction SilentlyContinue
Start-Process -FilePath "$env:appdata\Pulse Secure\Host Checker\uninstall.exe" -ErrorAction SilentlyContinue
Uninstall-Package -Name "Pulse Secure Installer Service" -Force -ErrorAction SilentlyContinue