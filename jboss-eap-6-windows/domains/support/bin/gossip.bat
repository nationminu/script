@echo off
rem -------------------------------------------------------------------------
rem JBoss Bootstrap Script for Windows
rem -------------------------------------------------------------------------
call "env.bat" 

set "CLASSPATH=%JBOSS_HOME%/modules/system/layers/base/org/jgroups/main/jgroups-3.2.13.Final-redhat-1.jar"

"%JAVA_HOME%\bin\java.exe" -classpath %CLASSPATH% -Dname=GOSSIP_ROUTER org.jgroups.stack.GossipRouter -port 12001 

