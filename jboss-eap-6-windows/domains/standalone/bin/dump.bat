@echo off
rem -------------------------------------------------------------------------
rem JBoss Bootstrap Script for Windows
rem -------------------------------------------------------------------------
call "env.bat"

set JAVA_OPTS=
setlocal  
	for /f "tokens=1" %%i in ('jps.exe -v ^| findstr ["[ServerName:%SERVER_NAME%]"] ') do (
		set pid=%%i
		jstack %%i >> %SERVER_NAME%.out
	) 

	echo "%JAVA_HOME%\bin\jstack is executed, passing in the Java process : jstack %pid% > %SERVER_NAME%.out "
endlocal 

pause