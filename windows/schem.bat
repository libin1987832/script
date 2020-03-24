set dir=%~dp0
set newfile=%dir%ip.bat
set gitfile=%dir%git.bat
set hexofile=%dir%hexo.bat
set hexod=%dir%hexo_d.bat
set autopaper=%dir%autopaper.bat
schtasks /create /tn "Repair tencent" /tr %newfile% /sc DAILY /st 20:00

schtasks /create /sc hourly /tn "git rs" /tr %gitfile%

schtasks /create /sc hourly /tn "hexo generated" /tr %hexofile%

schtasks /create /sc hourly /tn "hexo deploy" /tr %hexod%

schtasks /create /sc hourly /tn "paper auto content" /tr %autopaper%


rem how to hide cmd console
rem @echo off 
rem if "%1" == "h" goto begin 
rem mshta vbscript:createobject("wscript.shell").run("""%~nx0"" h",0)(window.close)&&exit 
rem :begin