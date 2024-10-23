remove-item -Path C:\Windows\Prefetch\*  -Recurse -Force -ErrorAction SilentlyContinue;
remove-item "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue;
remove-item -Path C:\Windows\Temp\* -Recurse -Force -ErrorAction SilentlyContinue 