@echo off
FOR /r %%i in (*) DO ( SET FileAttrib=%%~ai 
	IF %FileAttrib:~0,1%==d (
		echo %%i
	) ELSE (
		echo %%~fzi > fold.txt
	)
)

FOR -F "token=1,2" %%i IN (fold.txt) DO(
	set /a n=1
	FOR -F "token=1,2" %%x IN (fold.txt) DO(
		 )
	)


