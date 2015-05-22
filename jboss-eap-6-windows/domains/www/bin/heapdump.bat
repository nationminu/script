@echo off
rem -------------------------------------------------------------------------
rem JBoss Bootstrap Script for Windows
rem -------------------------------------------------------------------------
call "env.bat"

set JAVA_OPTS= 
setlocal 
	for /f "tokens=1" %%i in ('jps.exe -v ^| findstr /c:"[ServerName:%SERVER_NAME%]"') do  ( 
		jmap -dump:format=b,file=%SERVER_NAME%_%%i.hprof %%i
		echo "%JAVA_HOME%\bin\jmap is executed, passing in the Java process : jmap -dump:format=b,file=%SERVER_NAME%_%%i.hprof %%i
	)
endlocal

pause