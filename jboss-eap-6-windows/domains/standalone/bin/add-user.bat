@echo off
rem -------------------------------------------------------------------------
rem JBoss Bootstrap Script for Windows
rem -------------------------------------------------------------------------
call "env.bat"
 
set JAVA_OPTS=
set "JAVA_OPTS= %JAVA_OPTS% -Djboss.server.config.user.dir=%DOMAIN_BASE%/%SERVER_NAME%/configuration "

"%JBOSS_HOME%/bin/add-user.bat" %*
