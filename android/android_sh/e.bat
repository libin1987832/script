@echo off
chcp 65001
FOR /F "tokens=2 delims=:=" %%a IN ('adb.exe shell pm list packages -f') ^
DO FOR /F "tokens=1,2* delims=:" %%b IN ('adb.exe shell /data/local/tmp/aapt-arm-pie d badging %%a') ^
DO IF %%b==application-label-zh-CN echo %%c %%a