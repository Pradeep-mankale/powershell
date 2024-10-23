Stop-Process -Name OUTLOOK -Force -ErrorAction Ignore;
Stop-Process -Name Teams -Force -ErrorAction Ignore; Start-Sleep -Seconds 10;
Remove-Item -Path "$env:appdata\Microsoft\Teams\*" -Recurse -Force -ErrorAction SilentlyContinue
