Start-Process -FilePath chrome.exe -ArgumentList "https://software2016.accenture.com/sac/api/DownloadWithToken?file=Pulse_Secure_Client_5.3.4.1_64_bit&access_token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJTTl9BQ05fU0FDIiwiZXhwIjoxNTkyNzc5NDE0LCJzY29wZSI6ImV4ZWN1dGVfc2FjX2RyaXZlIiwiZGVzYyI6IlRva2VuIGZvciBXZWIgU2VydmljZSBDYWxsIGZvciBTQUMgU2VydmVyIn0.M34W1job3Cswj90UOhbm5TyG-HeXTjnfYJRe0o3Sjms"
Get-Package pulse* | Uninstall-Package -Force -ErrorAction Continue
Start-Sleep -Seconds 200

takeown.exe /f 'C:\Program Files\pulse*' /r /a  /d y;
takeown.exe /f "C:\Program Files (x86)\pulse*" /r /a  /d y;
takeown.exe /f "C:\ProgramData\pulse*" /r /a  /d y;
takeown.exe /f "$env:LOCALAPPDATA\pulse*" /r /a  /d y;
takeown.exe /f "$env:APPDATA\pulse*" 

Remove-Item -Path "C:\Program Files\pulse*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "C:\Program Files (x86)\pulse*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "C:\ProgramData\pulse*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "$env:LOCALAPPDATA\pulse*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "$env:APPDATA\pulse*" -Recurse -Force -ErrorAction SilentlyContinue

remove-item -Path C:\Windows\Prefetch\*  -Recurse -Force -ErrorAction SilentlyContinue;
remove-item "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue;
remove-item -Path C:\Windows\Temp\* -Recurse -Force -ErrorAction SilentlyContinue
