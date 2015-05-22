@echo off
rem -------------------------------------------------------------------------
rem JBoss Bootstrap Script for Windows 
rem -------------------------------------------------------------------------

set "HOUR=%time:~0,2%"
set "MIN=%time:~3,2%"
set "SEC=%time:~6,2%"
if %HOUR% LSS 10 set "HOUR=0%time:~1,1%"
set "TIME1=%HOUR%%MIN%%SEC%"
set "DATE1=%date:-=%"

set "DATETIME=%DATE1%_%TIME1%"

if "x%JAVA_HOME%" == "x" ( 
   echo ------------------------------------------------
   echo "If you do not already have the JDK software installed or if JAVA_HOME is not set, the JBOSS will not be start."
   echo ------------------------------------------------
   pause
   exit
)

rem ##### JBOSS Directory Setup #####
set "JBOSS_HOME=C:\jboss\jboss-eap-6.3"
set "DOMAIN_BASE=C:\jboss\domains"
set "SERVER_NAME=slave"
rem set "JBOSS_LOG_DIR=C:\logs\%SERVER_NAME%"

if "x%JBOSS_LOG_DIR%" == "x" (
     set "JBOSS_LOG_DIR=%DOMAIN_BASE%\%SERVER_NAME%\log"
) 

set "DOMAIN_BASE_DIR=%DOMAIN_BASE%\%SERVER_NAME%"

rem ##### Configration File #####
set "DOMAIN_CONFIG_FILE=domain.xml"
set "HOST_CONFIG_FILE=host-slave.xml"
 
set "HOST_NAME=WIN-UUPARFNEAN4"
set "NODE_NAME=%HOST_NAME%" 

rem ##### Bind Address #####
set "BIND_ADDR=192.168.102.165"

set "MULTICAST_ADDR=230.1.0.1"
set "MULTICAST_PORT=55200"
set "JMS_MULTICAST_ADDR=240.10.0.1"
set "MODCLUSTER_MULTICAST_ADDR=250.10.0.1"

set "MGMT_ADDR=192.168.102.165"
set "DOMAIN_MASTER_ADDR=192.168.102.165"
set "DOMAIN_MASTER_PORT=9999"
set "HOST_CONTROLLER_PORT=19999"

set "LAUNCH_JBOSS_IN_BACKGROUND=true"

rem ##### JBoss System module and User module directory #####
set "JBOSS_MODULEPATH=%JBOSS_HOME%\modules;%JBOSS_HOME%\modules.ext"

rem # JVM Options : Server 
set "JAVA_OPTS=-server "
set "JAVA_OPTS=%JAVA_OPTS% -D[ServerName:%SERVER_NAME%]"

rem # JVM Options : Memory  
set "JAVA_OPTS=%JAVA_OPTS% -Xms256m"
set "JAVA_OPTS=%JAVA_OPTS% -Xmx256m"
set "JAVA_OPTS=%JAVA_OPTS% -XX:PermSize=256m"
set "JAVA_OPTS=%JAVA_OPTS% -XX:MaxPermSize=256m"
set "JAVA_OPTS=%JAVA_OPTS% -Xss256k"

set "JAVA_OPTS=%JAVA_OPTS% -verbose:gc"
set "JAVA_OPTS=%JAVA_OPTS% -XX:+PrintGCTimeStamps"
set "JAVA_OPTS=%JAVA_OPTS% -XX:+PrintGCDetails "
set "JAVA_OPTS=%JAVA_OPTS% -Xloggc:%JBOSS_LOG_DIR%\gclog\gc_%DATETIME%.log"
set "JAVA_OPTS=%JAVA_OPTS% -XX:+UseParallelGC"
set "JAVA_OPTS=%JAVA_OPTS% -XX:+UseParallelOldGC"
rem #set "JAVA_OPTS=%JAVA_OPTS% -XX:+UseConcMarkSweepGC"
rem #set "JAVA_OPTS=%JAVA_OPTS% -XX:+UseG1GC"
set "JAVA_OPTS=%JAVA_OPTS% -XX:+ExplicitGCInvokesConcurrent"

set "JAVA_OPTS=%JAVA_OPTS% -XX:+HeapDumpOnOutOfMemoryError"
set "JAVA_OPTS=%JAVA_OPTS% -XX:HeapDumpPath=%JBOSS_LOG_DIR%\heapdump\java_pid_%DATETIME%.hprof"

rem # Linux Large Page Setting
rem #set "JAVA_OPTS=%JAVA_OPTS% -XX:+UseLargePages" 
rem #set "JAVA_OPTS=%JAVA_OPTS%-XX:LargePageSizeInBytes=2m"

set "JAVA_OPTS=%JAVA_OPTS% -Djava.net.preferIPv4Stack=true"
set "JAVA_OPTS=%JAVA_OPTS% -Dorg.jboss.resolver.warning=true"
set "JAVA_OPTS=%JAVA_OPTS% -Dsun.rmi.dgc.client.gcInterval=0x7FFFFFFFFFFFFFFE"
set "JAVA_OPTS=%JAVA_OPTS% -Dsun.rmi.dgc.server.gcInterval=0x7FFFFFFFFFFFFFFE"
set "JAVA_OPTS=%JAVA_OPTS% -Djboss.modules.system.pkgs=org.jboss.byteman"
set "JAVA_OPTS=%JAVA_OPTS% -Djava.awt.headless=true"

rem #for darwin
set "JBOSS_BASE_DIR=%DOMAIN_BASE_DIR%"

set "JAVA_OPTS=%JAVA_OPTS% -DDATE=%DATETIME%"
set "JAVA_OPTS=%JAVA_OPTS% -Djboss.domain.default.config=%DOMAIN_CONFIG_FILE%"
set "JAVA_OPTS=%JAVA_OPTS% -Djboss.host.default.config=%HOST_CONFIG_FILE%"
set "JAVA_OPTS=%JAVA_OPTS% -Djboss.domain.base.dir=%DOMAIN_BASE_DIR%"
set "JAVA_OPTS=%JAVA_OPTS% -Djboss.domain.master.address=%DOMAIN_MASTER_ADDR%"
set "JAVA_OPTS=%JAVA_OPTS% -Djboss.domain.master.port=%DOMAIN_MASTER_PORT%"
rem set "JAVA_OPTS=%JAVA_OPTS% -Djboss.node.name=%NODE_NAME%"
set "JAVA_OPTS=%JAVA_OPTS% -Djboss.bind.address.management=%MGMT_ADDR%"
set "JAVA_OPTS=%JAVA_OPTS% -Djboss.bind.address=%BIND_ADDR%"
set "JAVA_OPTS=%JAVA_OPTS% -Djboss.management.native.port=%HOST_CONTROLLER_PORT%"
set "JAVA_OPTS=%JAVA_OPTS% -Djboss.domain.log.dir=%JBOSS_LOG_DIR%"   
 
set "JAVA_OPTS=%JAVA_OPTS% -Dserver.mode=local"

rem # Use log4j in application
set "JAVA_OPTS=%JAVA_OPTS% -Dorg.jboss.as.logging.per-deployment=false "

title "Host Controller %SERVER_NAME%(JBOSS-EAP-6.3.3)"

echo ================================================
echo StartTime          = %DATETIME%
echo JBOSS_HOME         = %JBOSS_HOME%
echo DOMAIN_BASE        = %DOMAIN_BASE%
echo SERVER_NAME        = %SERVER_NAME%
echo DOMAIN_CONFIG_FILE = %DOMAIN_CONFIG_FILE%
echo HOST_CONFIG_FILE=  = %HOST_CONFIG_FILE% 
echo MULTICAST_ADDR     = %MULTICAST_ADDR%
echo DOMAIN_CONTROLLER  = %DOMAIN_MASTER_ADDR%:%DOMAIN_MASTER_PORT%
echo CONSOLE            = http://%DOMAIN_MASTER_ADDR%:9990
echo ================================================
