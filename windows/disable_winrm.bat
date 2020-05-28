@echo off
Powershell.exe Set-Item WSMan:\localhost\Service\Auth\Basic -Value $False
Powershell.exe Set-Item WSMan:\localhost\Service\AllowUnencrypted -Value $False
Powershell.exe winrm delete winrm/config/listener?address=*+transport=HTTP
Powershell.exe Stop-Service -force winrm
Powershell.exe Set-Service -Name winrm -StartupType Disabled
