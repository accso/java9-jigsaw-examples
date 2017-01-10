#!/bin/bash
export JAVA_HOME="/home/osboxes/jdk1.9.0_ea-b148-x64"
export ECLIPSE_HOME="/home/osboxes/eclipse4.7-M4"
export USER_HOME="/home/osboxes/.home"
export PATH="$JAVA_HOME/bin:$PATH"

export JAVA_OPTS="$HTTP_PROXY -Duser.home=$USER_HOME"

if [ ! "$1"=="" ] ; then 
   export ECLIPSE_WORKSPACE=$1
   else 
   export ECLIPSE_WORKSPACE=example_requires_exports
fi

export ECLIPSE="${ECLIPSE_HOME}/eclipse"
export ECLIPSE_OPT="-showlocation -vm $ECLPSE_JAVA/bin/java -vmargs --add-modules java.se.ee,java.sql -Xms128M -Xmx512M -XX:+AggressiveOpts -Xverify:none -Duser.home=$USER_HOME"

$ECLIPSE -data $ECLIPSE_WORKSPACE $ECLIPSE_OPT

