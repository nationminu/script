@echo off
rem -------------------------------------------------------------------------
rem JBoss Bootstrap Script for Windows
rem -------------------------------------------------------------------------
call "env.bat"
 
set JAVA_OPTS=
set "INSTANCE_NAME=support1" 
set "HOST_NAME=win-uuparfnean4" 

"%JBOSS_HOME%/bin/jboss-cli.bat" --connect --controller=%DOMAIN_MASTER_ADDR%:%DOMAIN_MASTER_PORT% --command=/host=%HOST_NAME%/server-config=%INSTANCE_NAME%:stop
