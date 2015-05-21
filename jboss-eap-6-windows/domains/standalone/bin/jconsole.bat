@echo off
rem -------------------------------------------------------------------------
rem JBoss Bootstrap Script for Windows
rem -------------------------------------------------------------------------
call "env.bat"

set JAVA_OPTS= 
echo ------------------------------------------------
echo  JMX URL : service:jmx:remoting-jmx://%MGMT_ADDR%:%CONTROLLER_PORT%"
echo ------------------------------------------------

"%JBOSS_HOME%/bin/jconsole.bat"
