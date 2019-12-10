@echo on 
color 2F
title 网络连通性检测
setlocal enabledelayedexpansion
set "year=%date:~0,4%"
set "month=%date:~5,2%"
set "day=%date:~8,2%"
echo %time%
set "hour_ten=%time:~0,1%"
echo %hour_ten%
set "hour_one=%time:~1,1%"
set "minute=%time:~3,2%"
set "second=%time:~6,2%"
if "%hour_ten%" == " " (
set DateTime=%year%_%month%_%day%_0%hour_one%_%minute%_%second%
) else (
set DateTime=%year%_%month%_%day%_%hour_ten%%hour_one%_%minute%_%second%
)
echo %DateTime%

ping -n 2 223.5.5.5>%temp%\1.ping & ping -n 2 223.6.6.6>>%temp%\1.ping    ::ping阿里公共DNS
findstr "TTL" %temp%\1.ping>nul

if %errorlevel%==0 (echo     √ 外网正常 & set  net=0) else (echo     × 外网不通 & set  net=-1) 
echo.
ping -n 2 frpsdty.muzi198783.club>%temp%\2.ping
findstr "TTL" %temp%\2.ping>nul
if %errorlevel%==0 (echo     √ frpsdty正常 & set /a net=%net%+1) else (echo  × frpsdty不通)
echo.

ping -n 2 127.0.0.1>%temp%\4.ping
findstr "TTL" %temp%\4.ping>nul
if %errorlevel%==0 (echo     √ TCP/IP协议正常 & set /a net=%net%+1) else (echo     × TCP/IP协议异常)
rem if exist %temp%\*.ping del %temp%\*.ping                ::删除缓存文件
echo net=%net%

echo.

echo del gtr 2088
for /f "delims=" %%a in ('dir /s /b %temp%\netlog.txt') do if %%~za gtr 208896 del /a /f "%%a"

if exist %temp%\netlog.txt (
	echo exist
	for /f "tokens=1-4 delims= " %%i in (%temp%\netlog.txt) do (
	set seq=%%i
	set status=%%k
	set restart=%%l
	)
	set /a seq=!seq!+1
	if !status! lss 2 (
	set /a restart=!restart!+1
	set wr=1) else (
	set wr=0
	set restart=0)
	echo exist33
	if !net! lss 2  (set wr=1&if !restart! lss 20 (timeout /t 60 /nobreak&shutdown -r)) else (echo network is OK~ )
	if !wr! equ 1 (echo !seq! %DateTime% %net% !restart!) >> %temp%\netlog.txt
	echo !seq! %DateTime% %net% !restart! 
) else (
	echo not exist
	echo seq time status restart > %temp%\netlog.txt
	echo 1 %DateTime% %net% 0 >>%temp%\netlog.txt
)


echo existfff



pause

