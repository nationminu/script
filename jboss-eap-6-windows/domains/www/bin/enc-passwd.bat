@echo on
rem -------------------------------------------------------------------------
rem JBoss Bootstrap Script for Windows
rem -------------------------------------------------------------------------
call "env.bat"
  
if "x%1%" == "x" (
    echo Usage: ^> enc-passwd.bat ^<message to encrypt^>
    pause 
    goto done
)

set CLASSPATH=
set "CLASSPATH=%JBOSS_HOME%/modules/system/layers/base/org/picketbox/main/picketbox-4.0.19.SP8-redhat-1.jar;%JBOSS_HOME%/modules/system/layers/base/org/jboss/logging/main/jboss-logging-3.1.4.GA-redhat-1.jar;%CLASSPATH%"
 
java  org.picketbox.datasource.security.SecureIdentityLoginModule %1%

:done