@echo off
rem -------------------------------------------------------------------------
rem JBoss Bootstrap Script for Windows
rem -------------------------------------------------------------------------

echo %1%
echo %2%
 

set res=false
if "x%1%" == "x" set res=true
if "x%2%" == "x" set res=true
 
if "%res%"=="true" (
    echo "Usage : perf.bat <host_ip_address> <name>"
    echo " ex) perf.bat 123.123.123.123 NodeA"
    pause 
    goto done
)


echo "java -cp jgroups-3.2.5.Final.jar -Djava.net.preferIPv4Stack=true -Djgroups.bind_addr=%1 org.jgroups.tests.perf.MPerf -name %2"
java -cp jgroups-3.2.5.Final.jar -Djava.net.preferIPv4Stack=true -Djgroups.bind_addr=%1 org.jgroups.tests.perf.MPerf -name %2


:done