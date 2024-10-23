Start-Process -FilePath chrome.exe -ArgumentList https://myoffice.accenture.com/personal/pradeep_mankale_accenture_com/_layouts/15/download.aspx?SourceUrl=%2Fpersonal%2Fpradeep%5Fmankale%5Faccenture%5Fcom%2FDocuments%2FAll%20softwares%2FBeyondTrust%5FPrivilege%5F5%2E5%2E144%2FBeyondTrust%5FPrivilege%5F5%2E5%2E144%2Eexe
get-package privilege* | Uninstall-Package -Force -ErrorAction SilentlyContinue
Start-Sleep -Seconds 200
Remove-Item -Path "C:\Program Files\avecto*" -Force -Recurse -ErrorAction SilentlyContinue
Remove-Item -Path "C:\Program Files (x86)\avecto*" -Force -Recurse -ErrorAction SilentlyContinue
Remove-Item -Path "C:\ProgramData\avecto*" -Force -Recurse -ErrorAction SilentlyContinue
Remove-Item -Path "C:\Program Files\avecto*" -Force -Recurse -ErrorAction SilentlyContinue
Remove-Item -Path  "$env:LOCALAPPDATA\avect*" -Force -Recurse -ErrorAction SilentlyContinue
Remove-Item -Path HKLM:\SOFTWARE\WOW6432Node\Avecto -Force -Recurse -ErrorAction SilentlyContinue
Remove-Item -Path HKLM:\SOFTWARE\Avecto* -Force -Recurse -ErrorAction SilentlyContinue

remove-item -Path C:\Windows\Prefetch\*  -Recurse -Force -ErrorAction SilentlyContinue;
remove-item "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue;
remove-item -Path C:\Windows\Temp\* -Recurse -Force -ErrorAction SilentlyContinue