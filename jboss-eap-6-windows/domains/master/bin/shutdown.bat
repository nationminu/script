@echo off
rem -------------------------------------------------------------------------
rem JBoss Bootstrap Script for Windows
rem -------------------------------------------------------------------------
call "env.bat"

set JAVA_OPTS=
"%JBOSS_HOME%/bin/jboss-cli.bat" --connect --controller=%DOMAIN_MASTER_ADDR%:%DOMAIN_MASTER_PORT% --command=/host=master:shutdown

