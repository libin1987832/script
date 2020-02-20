@echo off
chcp 65001 && FOR /F "tokens=1,2* delims= " %%a IN ('e.bat') DO FOR %%c IN (充值中心 美居) DO IF '%%c'==%%a echo %%c %%b