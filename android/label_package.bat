@echo off
chcp 65001
echo # !/system/bin/sh > rmdpk.sh
FOR /F "tokens=2 delims=:=" %%a IN ('adb.exe shell pm list packages -s -f') ^
DO FOR /F "tokens=1,2* delims=:" %%b IN ('adb.exe shell /data/local/tmp/aapt-arm-pie d badging %%a') ^
DO IF %%b==application-label-zh-CN echo %%c %%a && echo %%c %%a >> rmdpk.sh

echo "manual delete apk so that rmdpk.sh"
echo "adb push rm.sh /data/local/tmp"
echo "adb shell"
echo "adb su"
echo awk -F {print ^"rm -r^" $1} ^| sh