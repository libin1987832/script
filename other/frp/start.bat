@echo off  
start cmd /k "cd /d D:\frp && ip.bat &&frpc.exe -c frpc_tmp.ini && taskkill /f /t /im cmd.exe"