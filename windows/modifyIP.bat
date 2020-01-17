:: 设置IP地址
set /p choice=请选择设置类型(1:静态IP / 2:自动获取IP):
echo.
if "%choice%"=="1" goto ip1
if "%choice%"=="2" goto ip2
goto main
:ip1
echo IP自动设置开始...
echo.
echo 正在设置IP及子网掩码
cmd /c netsh interface ip set address name="以太网" source=static addr=192.168.0.250 mask=255.255.255.0 gateway=192.168.0.1 gwmetric=1
echo 正在设置DNS服务器
 
cmd /c netsh interface ip add dnsservers name="以太网" address=192.168.0.1 index=1
cmd /c netsh interface ip add dnsservers name="以太网" address=192.168.0.1 index=2
echo 设置完成
pause
exit
if errorlevel 2 goto main
if errorlevel 1 goto end
:ip2
echo IP自动设置开始....
echo.
echo 自动获取IP地址....
netsh interface ip set address name = "以太网" source = dhcp
echo 自动获取DNS服务器....
netsh interface ip set dns name = "以太网" source = dhcp
@rem 设置自动获取IP
echo 设置完成
pause
exit
if errorlevel 2 goto main
if errorlevel 1 goto end
:end 