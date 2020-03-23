set git="D:\Program Files\Git\bin\git" 
set dir=%~dp0
set newlog=%dir%git.log
F:
cd code_bak\git
for /f "tokens=1,2,3,4,5 delims= " %%i in (%dir%git.txt) do (
echo enter %%i project >> %newlog%
cd %%i
%git% pull
@echo  *.%%j type to stage >> %newlog%
%git% add *.%%j >> %newlog%
if %%k==2 %git% add *.%%l >> %newlog%
if %%k==3 (
	%git% add *.%%l >> %newlog%
	%git% add *.%%m >> %newlog%)
@echo commit message %date:~0,4%年%date:~5,2%月%date:~8,2%日 >> %newlog%
@echo commit reply message >>%newlog%
%git% commit -m %date:~0,4%年%date:~5,2%月%date:~8,2%日 >> %newlog%
@echo push github.com >> %newlog%
@echo github reply message >>%newlog%
%git% push >> %newlog%
@echo =next project >>%newlog%
cd ..
)
echo ====================== >>%newlog%


