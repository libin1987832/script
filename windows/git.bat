set git="D:\Program Files\Git\bin\git" 
set dir=%~dp0
set newlog=%dir%git.log
F:
cd code_bak\git
for /f "tokens=1,2,3,4,5 delims= " %%i in (%dir%git.txt) do (
echo %%i >> %newlog%
cd %%i
%git% pull >> %newlog%
echo  *.%%j >> %newlog%
%git% add *.%%j
if %%k==2 %git% add *.%%l 
if %%k==3 (
	%git% add *.%%l 
	%git% add *.%%m )	
%git% commit -m %date:~3,4%-%date:~8,2%-%date:~11,2% >> %newlog%
%git% push >> %newlog%
echo ------------------ >>%newlog%
cd ..
)
echo -----------%date:~3,4%-%date:~8,2%-%date:~11,2% %time:~0,2%:%time:~3,2%:%time:~6,2%-------- >>%newlog%

PowerShell.exe -file %dir%email.ps1
cd %dir%
C:



