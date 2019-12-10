@echo off
for /f "tokens=4" %%a in ('route print^|findstr 0.0.0.0.*0.0.0.0') do (
 set IP=%%a
)
rem echo %IP%
set file=D:\frp\frpc.ini
set file_tmp=D:\frp\frpc_tmp.ini
set source1=127.0.0.1

set replaced1=%IP%
del %file_tmp%
for /f "delims=" %%i in (%file%) do (
	rem if "%%i"=="local_ip = 127.0.0.1" (set str="local_ip = "%IP%)
         if "%%i"=="local_ip = 127.0.0.1" (echo local_ip = %IP%) else (echo %%i)
)>%file_tmp%

