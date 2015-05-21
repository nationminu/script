#!/bin/sh
# env.sh - start a new shell with instance variables set

DATE=`date +%Y%m%d%H%M%S`

export SERVER_USER=jboss
export SERVER_NAME=simple

## set jboss base env
export SERVER_HOME=/home/jboss/jboss-ews
export CATALINA_HOME=$SERVER_HOME/jboss-ews-2.1/tomcat7
export CATALINA_BASE=$SERVER_HOME/domains/$SERVER_NAME
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$SERVER_HOME/lib

export JAVA_HOME=/usr/java/jdk1.7.0_60
export LOG_DIR=$CATALINA_BASE/logs

export PATH=$JAVA_HOME/bin:$CATALINA_HOME/bin:$PATH

   JAVA_OPTS="-server"
   JAVA_OPTS="$JAVA_OPTS -Dserver=$SERVER_NAME"
   JAVA_OPTS="$JAVA_OPTS -Dserver.base=$SERVER_HOME"
   JAVA_OPTS="$JAVA_OPTS -Dcatalina.base.log=$LOG_DIR"
   JAVA_OPTS="$JAVA_OPTS -Djboss.application.dir=/home/jboss/applications/simple/simple.war"

   JAVA_OPTS="$JAVA_OPTS -Dfile.encoding=UTF-8"
   JAVA_OPTS="$JAVA_OPTS -Djboss.get.encoding=UTF-8"
   JAVA_OPTS="$JAVA_OPTS -Djboss.server.user=${SERVER_USER}"
   JAVA_OPTS="$JAVA_OPTS -Djboss.jvmRoute=${SERVER_NAME}"

   JAVA_OPTS="$JAVA_OPTS -Xms1024m"
   JAVA_OPTS="$JAVA_OPTS -Xmx1024m"
   JAVA_OPTS="$JAVA_OPTS -XX:PermSize=256m"
   JAVA_OPTS="$JAVA_OPTS -XX:MaxPermSize=256m"
   JAVA_OPTS="$JAVA_OPTS -Xss256k"

   JAVA_OPTS="$JAVA_OPTS -verbose:gc"
   JAVA_OPTS="$JAVA_OPTS -Xloggc:$LOG_DIR/gclog/${SERVER_NAME}_gc.log"
   JAVA_OPTS="$JAVA_OPTS -XX:+PrintGCDetails"
   JAVA_OPTS="$JAVA_OPTS -XX:+PrintGCTimeStamps"
   JAVA_OPTS="$JAVA_OPTS -XX:+PrintHeapAtGC"
   JAVA_OPTS="$JAVA_OPTS -XX:+HeapDumpOnOutOfMemoryError"
   JAVA_OPTS="$JAVA_OPTS -XX:HeapDumpPath=$LOG_DIR/logs/${SERVER_NAME}_java_pid_$DATA.hprof"

   JAVA_OPTS="$JAVA_OPTS -Dcom.sun.management.jmxremote"
   JAVA_OPTS="$JAVA_OPTS -Dcom.sun.management.jmxremote.port=8186"
   JAVA_OPTS="$JAVA_OPTS -Dcom.sun.management.jmxremote.ssl=false"
   JAVA_OPTS="$JAVA_OPTS -Dcom.sun.management.jmxremote.authenticate=false"

   # SecureRandom Bug
   # http://wiki.apache.org/tomcat/HowTo/FasterStartUp
   JAVA_OPTS="$JAVA_OPTS -Djava.security.egd=file:/dev/./urandom"

   # Cluster Group Member(bind_addres:local ip,other_bind_adressx=other member) using server-ha.xml
   JAVA_OPTS="$JAVA_OPTS -Dbind_address=172.16.167.10"
   JAVA_OPTS="$JAVA_OPTS -Dother_bind_address1=172.16.167.20"
   JAVA_OPTS="$JAVA_OPTS -Dother_bind_address2=172.16.167.30"
   JAVA_OPTS="$JAVA_OPTS -Dother_bind_address3=172.16.167.40"

export JAVA_OPTS

echo "================================================"
echo "SERVER_HOME=$SERVER_HOME"
echo "CATALINA_HOME=$CATALINA_HOME"
echo "CATALINA_BASE=$CATALINA_BASE"
echo "SERVER_NAME=$SERVER_NAME"
echo "================================================"

