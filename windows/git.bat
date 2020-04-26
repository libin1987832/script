set git="C:\Program Files\Git\bin\git" 
set dir=%~dp0
set newlog=%dir%git.log
E:
cd git
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
%git% commit -m %date:~0,4%-%date:~5,2%-%date:~8,2% >> %newlog%
%git% push >> %newlog%
echo
echo ------------------ >>%newlog%
cd ..
)
echo -----------%date:~0,4%-%date:~5,2%-%date:~8,2%-------- >>%newlog%

PowerShell.exe -file %dir%email.ps1
cd %dir%
C:


