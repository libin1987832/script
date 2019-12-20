set dir=%~dp0
set newfile=%dir%cmd\ip.bat
set gitfile=%dir%cmd\git.bat
schtasks /create /tn "Repair tencent" /tr %newfile% /sc DAILY /st 20:00

schtasks /create /sc hourly /tn "git rs" /tr %newfile%