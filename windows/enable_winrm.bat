@echo off
Powershell.exe Set-WSManQuickConfig -Force
Powershell.exe Set-Item WSMan:\localhost\Service\Auth\Basic -Value $True
Powershell.exe Set-Item WSMan:\localhost\Service\AllowUnencrypted -Value $True
