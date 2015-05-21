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
   echo "If you do not already have the JDK software installed and if JAVA_HOME is not set, the JBOSS will not be start."
   echo ------------------------------------------------
   pause
   exit
)

rem ##### JBOSS Directory Setup #####
set "JBOSS_HOME=C:\jboss\jboss-eap-6.3"
set "DOMAIN_BASE=C:\jboss\domains"
set "SERVER_NAME=standalone"
rem set "JBOSS_LOG_DIR=C:\logs\%SERVER_NAME%"

if "x%JBOSS_LOG_DIR%" == "x" (
     set "JBOSS_LOG_DIR=%DOMAIN_BASE%\%SERVER_NAME%\log"
) 

rem ##### Configration File #####
rem # set "CONFIG_FILE=standalone.xml"
set "CONFIG_FILE=standalone-ha.xml"

set "EXTERNAL_DEPLOYMENT=C:\JBOSS\applications"

set "HOST_NAME=WIN-UUPARFNEAN4"
set "NODE_NAME=%SERVER_NAME%"
set "PORT_OFFSET=0"

rem ##### Bind Address #####
set "BIND_ADDR=0.0.0.0"

set "MULTICAST_ADDR=230.1.0.1"
set "JMS_MULTICAST_ADDR=231.7.0.1"
set "MODCLUSTER_MULTICAST_ADDR=224.0.1.105"

set "MGMT_ADDR=127.0.0.1"

set "CONTROLLER_IP=%MGMT_ADDR%"
set /a "CONTROLLER_PORT=9999+%PORT_OFFSET%"

set "LAUNCH_JBOSS_IN_BACKGROUND=true"

rem ##### JBoss System module and User module directory #####
rem set "JBOSS_MODULEPATH=%JBOSS_HOME%\modules;%JBOSS_HOME%\modules.ext"

rem # JVM Options : Server
set JAVA_OPTS=
set "JAVA_OPTS=-server "
set "JAVA_OPTS=%JAVA_OPTS% -D[ServerName:%SERVER_NAME%] "

rem # JVM Options : Memory  
set "JAVA_OPTS=%JAVA_OPTS% -Xms1024m"
set "JAVA_OPTS=%JAVA_OPTS% -Xmx1024m"
set "JAVA_OPTS=%JAVA_OPTS% -XX:PermSize=256m"
set "JAVA_OPTS=%JAVA_OPTS% -XX:MaxPermSize=256m"

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
set "JAVA_OPTS=%JAVA_OPTS% -XX:HeapDumpPath=%JBOSS_LOG_DIR%/heapdump/java_pid_%DATETIME%.hprof"

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
set "JBOSS_BASE_DIR=%DOMAIN_BASE%\%SERVER_HOME%"


set "JAVA_OPTS=%JAVA_OPTS% -DDATE=%DATETIME%"
set "JAVA_OPTS=%JAVA_OPTS% -Djboss.server.base.dir=%DOMAIN_BASE%\%SERVER_NAME%"
set "JAVA_OPTS=%JAVA_OPTS% -Djboss.server.log.dir=%JBOSS_LOG_DIR%"
set "JAVA_OPTS=%JAVA_OPTS% -Djboss.external.deployments=%EXTERNAL_DEPLOYMENT%"
set "JAVA_OPTS=%JAVA_OPTS% -Djboss.socket.binding.port-offset=%PORT_OFFSET%"
set "JAVA_OPTS=%JAVA_OPTS% -Djboss.node.name=%NODE_NAME%"
set "JAVA_OPTS=%JAVA_OPTS% -Djboss.bind.address.management=%MGMT_ADDR%"
set "JAVA_OPTS=%JAVA_OPTS% -Djboss.bind.address=%BIND_ADDR%"  

set "JAVA_OPTS=%JAVA_OPTS% -Djboss.default.multicast.address=%MULTICAST_ADDR%"
set "JAVA_OPTS=%JAVA_OPTS% -Djboss.messaging.group.address=%JMS_MULTICAST_ADDR%"
set "JAVA_OPTS=%JAVA_OPTS% -Djboss.modcluster.multicast.address=%MODCLUSTER_MULTICAST_ADDR%"

rem # jgroups stack
rem # udp, tcp, tcp-fileping, tcp-gossip
set "JAVA_OPTS=%JAVA_OPTS% -Djboss.default.jgroups.stack=udp"
set "JAVA_OPTS=%JAVA_OPTS% -Djgroups.tcpping.initial_hosts=192.168.56.101[7600],192.168.56.101[7700],"
set "JAVA_OPTS=%JAVA_OPTS% -Djgroups.fileping.location=/share/data/fileping"
set "JAVA_OPTS=%JAVA_OPTS% -Djgroups.tcpgossip.hosts=192.168.56.101[12001],172.16.167.20[12001]"

set "JAVA_OPTS=%JAVA_OPTS% -Dserver.mode=local"

rem # Use log4j in application
set "JAVA_OPTS=%JAVA_OPTS% -Dorg.jboss.as.logging.per-deployment=false "

title "%SERVER_NAME%(JBOSS-EAP-6.3.3)"

echo ================================================
echo StartTime      = %DATETIME%
echo JBOSS_HOME     = %JBOSS_HOME%
echo DOMAIN_BASE    = %DOMAIN_BASE%
echo SERVER_NAME    = %SERVER_NAME%
echo CONFIG_FILE    = %CONFIG_FILE%
echo BIND_ADDR      = %BIND_ADDR%
echo PORT_OFFSET    = %PORT_OFFSET%
echo MULTICAST_ADDR = %MULTICAST_ADDR%
echo CONTROLLER     = %CONTROLLER_IP%:%CONTROLLER_PORT%
echo ================================================"
