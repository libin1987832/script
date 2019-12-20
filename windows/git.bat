set git="D:\Program Files\Git\bin\git" 
H:

set dir=%~dp0
set newlog=%dir%git.log
cd git
for /f "tokens=1,2 delims= " %%i in (%dir%git.txt) do (
echo cd %%i
cd %%i
%git% pull >> %newlog%
echo add *.%%j >> %newlog%
%git% add *.%%j >> %newlog%
echo commit -m %date:~0,4%年%date:~5,2%月%date:~8,2%日 >> %newlog%
%git% commit -m %date:~0,4%年%date:~5,2%月%date:~8,2%日 >> %newlog%
echo push >> %newlog%
%git% push >> %newlog%
cd ..
)


