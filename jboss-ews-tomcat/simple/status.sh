#!/bin/sh
. ./env.sh

ps -ef | grep java | grep "server=$SERVER_NAME "
