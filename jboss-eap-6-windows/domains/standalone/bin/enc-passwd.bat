@echo on
rem -------------------------------------------------------------------------
rem JBoss Bootstrap Script for Windows
rem -------------------------------------------------------------------------
call "env.bat"

set SNAME=%1%
set ACCOUNT=%2%
set PASSWORD=%3% 

set CLASSPATH=
set "CLASSPATH=%JBOSS_HOME%/modules/system/layers/base/org/picketbox/main/picketbox-4.0.19.SP8-redhat-1.jar;%JBOSS_HOME%/modules/system/layers/base/org/jboss/logging/main/jboss-logging-3.1.4.GA-redhat-1.jar;%CLASSPATH%"

echo "DB Account:%ACCOUNT%"
echo "password:%PASSWORD%"
 
java  org.picketbox.datasource.security.SecureIdentityLoginModule %PASSWORD%


if EXIST "%DOMAIN_BASE%\%SERVER_NAME%\bin\enc.cli" (
  del "%DOMAIN_BASE%\%SERVER_NAME%\bin\enc.cli"
) 

setlocal  
	for /f "tokens=3" %%i in ('java.exe org.picketbox.datasource.security.SecureIdentityLoginModule %PASSWORD%') do @set ENC_PASSWORD=%%i
	echo %ENC_PASSWORD%

	echo /subsystem=security/security-domain=%SNAME%/:add(cache-type=default) > enc.cli
	echo /subsystem=security/security-domain=%SNAME%/authentication=classic:add(login-modules=[{"code" =^> "org.picketbox.datasource.security.SecureIdentityLoginModule", "flag" =^> "required", "module-options"  =^> ["username" =^> "%ACCOUNT%","password"=^>"%ENC_PASSWORD%"],"managedConnectionFactoryName"=^>"jboss.jca:name=jpetstore,service=LocalTxCM"}]) >> enc.cli

	%DOMAIN_BASE%\%SERVER_NAME%\bin\jboss-cli.bat --file=%DOMAIN_BASE%\%SERVER_NAME%\bin\enc.cli
endlocal

