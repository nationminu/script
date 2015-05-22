@echo off
rem -------------------------------------------------------------------------
rem JBoss Bootstrap Script for Windows
rem -------------------------------------------------------------------------
call "env.bat"

set JAVA_OPTS=
set "JAVA_OPTS=-Djava.awt.headless=false"

"%JBOSS_HOME%/bin/jboss-cli.bat"  --controller=%DOMAIN_MASTER_ADDR%:%DOMAIN_MASTER_PORT%  --connect %*
