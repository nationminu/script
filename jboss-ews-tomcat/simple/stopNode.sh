#!/bin/sh
. ./env.sh

LOG_DATE=`date +%Y-%m-%d`

# ------------------------------------
PID=`ps -ef | grep java | grep "=$SERVER_NAME" | awk '{print $2}'`

if [ e$PID == "e" ]
then
    echo "JBOSS($SERVER_NAME) is not RUNNING..."
    exit;
fi
# ------------------------------------
UNAME=`id -u -n`
if [ e$UNAME != "e$SERVER_USER" ]
then
    echo "$SERVER_USER USER to start JBoss SERVER - $SERVER_NAME..."
    exit;
fi
# ------------------------------------

unset JAVA_OPTS

$CATALINA_HOME/bin/catalina.sh stop 

# ------------------------------------
if [ e$1 = "enotail" ]
then
    echo "Starting... $SERVER_NAME"
    exit;
fi
# ------------------------------------

exit_code=0
retry=10
try=0
while [ "$exit_code" = "0" ]
do
        try=$(expr $try + 1)
        exit_code=$(tail -n 5 $LOG_HOME/${SERVER_NAME}.out | grep "Destroying ProtocolHandler" |grep "ajp-apr-8009" | wc -l)
        sleep 3
        echo "$try check the vm status please wait" 

        if [ e$try = "e$retry" ]
        then
                echo "jboss killed after retry $retry times" 
                ./kill.sh
                exit
        fi
done
echo "vm  stop"
