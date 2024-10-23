takeown.exe /f C:\Windows\ccmcache /r /a /d y
takeown.exe /f C:\Windows\ccmsetup /r /a /d y
takeown.exe /f C:\Windows\CCM /r /a /d y
Start-Sleep -Seconds 60
Remove-Item -Path C:\Windows\ccmcache -Recurse -Force -ErrorAction Continue
Remove-Item -Path C:\Windows\ccmsetup -Recurse -Force -ErrorAction Continue
Remove-Item -Path C:\Windows\CCM -Recurse -Force -ErrorAction Continue
