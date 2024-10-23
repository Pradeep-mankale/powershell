start-process -FilePath chrome.exe -ArgumentList https://myoffice.accenture.com/personal/pradeep_mankale_accenture_com/_layouts/15/download.aspx?SourceUrl=%2Fpersonal%2Fpradeep%5Fmankale%5Faccenture%5Fcom%2FDocuments%2FAll%20softwares%2FReceiverCleanupUtility%2Eexe
Start-Process -FilePath chrome.exe -ArgumentList https://downloads.citrix.com/13503/CitrixReceiver.exe?__gda__=1592770790_f84df7d5ca9f4c5e68e9bdc388078ce5
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
start-sleep -Seconds 20;
Start-Process -FilePath "$env:USERPROFILE\Downloads\ReceiverCleanupUtility.exe"

