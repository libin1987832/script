:: ����IP��ַ
set /p choice=��ѡ����������(1:��̬IP / 2:�Զ���ȡIP):
echo.
if "%choice%"=="1" goto ip1
if "%choice%"=="2" goto ip2
goto main
:ip1
echo IP�Զ����ÿ�ʼ...
echo.
echo ��������IP����������
cmd /c netsh interface ip set address name="��̫��" source=static addr=192.168.0.250 mask=255.255.255.0 gateway=192.168.0.1 gwmetric=1
echo ��������DNS������
 
cmd /c netsh interface ip add dnsservers name="��̫��" address=192.168.0.1 index=1
cmd /c netsh interface ip add dnsservers name="��̫��" address=192.168.0.1 index=2
echo �������
pause
exit
if errorlevel 2 goto main
if errorlevel 1 goto end
:ip2
echo IP�Զ����ÿ�ʼ....
echo.
echo �Զ���ȡIP��ַ....
netsh interface ip set address name = "��̫��" source = dhcp
echo �Զ���ȡDNS������....
netsh interface ip set dns name = "��̫��" source = dhcp
@rem �����Զ���ȡIP
echo �������
pause
exit
if errorlevel 2 goto main
if errorlevel 1 goto end
:end 