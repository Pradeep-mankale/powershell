New-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate -PropertyType dword -Name DisableWindowsUpdateAccess -Value 3 -Force;
New-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU -PropertyType dword -Name NoAutoUpdate -Value 0 -Force;
New-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU -PropertyType dword -Name UseWUServer -Value 0 -Force;
start ms-settings:windowsupdate

 
