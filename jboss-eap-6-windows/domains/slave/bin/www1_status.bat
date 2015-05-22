@echo off
rem -------------------------------------------------------------------------
rem JBoss Bootstrap Script for Windows
rem -------------------------------------------------------------------------
call "env.bat"
 
set JAVA_OPTS=
set "INSTANCE_NAME=www1" 

set JAVA_OPTS=
setlocal 
"%JAVA_HOME%\bin\jps" -v | findstr /c:"[Server:%INSTANCE_NAME%]"
endlocal

pause