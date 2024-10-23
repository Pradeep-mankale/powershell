Start-Process -FilePath "C:\Windows\CCM\CMTrace" -ArgumentList "C:\Windows\CCM\Logs\WUAHandler.log";
Start-Process -FilePath "C:\Windows\CCM\CMTrace" -ArgumentList "C:\Windows\CCM\Logs\UpdatesStore.log";
Start-Process -FilePath "C:\Windows\CCM\CMTrace" -ArgumentList "C:\Windows\CCM\Logs\UpdatesHandler.log";
Start-Process -FilePath "C:\Windows\CCM\CMTrace" -ArgumentList "C:\Windows\CCM\Logs\UpdatesDeployment.log";
eventvwr