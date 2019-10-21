@echo off
chcp 65001
echo # !/system/bin/sh > rmsh.sh
FOR /F "tokens=1,2,3 delims=:=" %%a IN ('adb.exe shell pm list packages -s -f') ^
DO FOR /F "tokens=1,2* delims=:" %%x IN ('adb.exe shell /data/local/tmp/aapt-arm-pie d badging %%b') ^
DO IF %%x==application-label-zh-CN echo echo %%y %%c && echo echo %%y;pm uninstall %%c>> rmsh.sh
