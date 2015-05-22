@echo off
rem -------------------------------------------------------------------------
rem JBoss Bootstrap Script for Windows
rem -------------------------------------------------------------------------
call "env.bat"

set JAVA_OPTS=

echo "Compress %SERVER_NAME%(%DOMAIN_BASE%\%SERVER_NAME%) Directory"

"%JAVA_HOME%/bin/jar.exe" -cf %SERVER_NAME%_%DATETIME%.zip "%DOMAIN_BASE%\%SERVER_NAME%"
"%JBOSS_HOME%/bin/jdr.bat" %* 

pause

