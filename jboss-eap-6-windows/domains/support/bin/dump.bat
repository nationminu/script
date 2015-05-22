@echo off
rem -------------------------------------------------------------------------
rem JBoss Bootstrap Script for Windows
rem -------------------------------------------------------------------------
call "env.bat"

set JAVA_OPTS=
setlocal  
	for /f "tokens=1" %%i in ('jps.exe -v ^| findstr /c:"[ServerName:%SERVER_NAME%]"') do ( 
		jstack %%i >> %SERVER_NAME%_%%i.out
		
		echo "%JAVA_HOME%\bin\jstack is executed, passing in the Java process : jstack %%i > %SERVER_NAME%_%%i.out "
	) 

endlocal 

pause