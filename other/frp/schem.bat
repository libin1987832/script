set dir=%~dp0
set newfile=%dir%cmd\ip.bat
schtasks /create /tn "Repair tencent" /tr %newfile% /sc DAILY /st 20:00