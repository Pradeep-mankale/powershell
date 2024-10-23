remove-item -path "C:\Windows\System32\GroupPolicy\User\*" -Recurse -force
Remove-Item -Path "C:\Windows\System32\GroupPolicy\Machine\*" -Recurse -Force
Start-Process -FilePath cmd
control smscfgrc