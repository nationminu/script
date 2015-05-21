#!/bin/sh
. ./env.sh

$CATALINA_HOME/bin/digest.sh -a sha "$@" 
