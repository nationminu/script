@echo off
rem -------------------------------------------------------------------------
rem JBoss Bootstrap Script for Windows
rem -------------------------------------------------------------------------
call "env.bat"

set JAVA_OPTS=
setlocal 
"%JAVA_HOME%\bin\jps" -v | findstr /c:"[ServerName:%SERVER_NAME%]"
endlocal

pause

