  FOR /F "tokens=2 delims=:=" %i IN ('adb.exe shell pm list packages -f') 
  DO 
  	FOR /F "tokens=1 delims=:" %j IN ('adb.exe shell /data/local/tmp/aapt-arm-pie d badging' %i)
	DO
		IF %j == "application-label-zh-CN" 
			echo %k
