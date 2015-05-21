@echo off
rem -------------------------------------------------------------------------
rem JBoss Bootstrap Script for Windows
rem -------------------------------------------------------------------------
call "env.bat"
 
if NOT EXIST "%JBOSS_LOG_DIR%" (
  mkdir %JBOSS_LOG_DIR%
)
if NOT EXIST "%JBOSS_LOG_DIR%\gclog" (
  mkdir %JBOSS_LOG_DIR%\gclog
)

setlocal  
for /f "tokens=1" %%i in ('jps.exe -v ^| findstr ["[ServerName:%SERVER_NAME%]"] ') do @set pid=%%i
 
if not "x%pid%" == "x" (  
    echo ------------------------------------------------
    echo "JBOSS already running, the JBOSS will not be start."
    echo SERVER NAME : %SERVER_NAME%
    echo SERVER PID  : %pid%
    echo ------------------------------------------------
    pause
    goto done
)
endlocal

if EXIST "%JBOSS_LOG_DIR%\gclog\gc.log" (
  move %JBOSS_LOG_DIR%\gclog\gc.log %JBOSS_LOG_DIR%\gclog\gc.log.%datetime%
)

"%JBOSS_HOME%/bin/standalone.bat" -P=%DOMAIN_BASE%\%SERVER_NAME%\bin\env.properties -c %CONFIG_FILE%

:done