@echo off
rem -------------------------------------------------------------------------
rem JBoss Bootstrap Script for Windows
rem -------------------------------------------------------------------------
call "env.bat"

set JAVA_OPTS=
"%JBOSS_HOME%/bin/jboss-cli.bat" --connect --controller=%CONTROLLER_IP%:%CONTROLLER_PORT% --command=:shutdown
