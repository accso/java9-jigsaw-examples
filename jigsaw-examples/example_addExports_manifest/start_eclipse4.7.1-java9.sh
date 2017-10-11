#!/bin/sh

#
# Start script for Eclipse 4.7.1a with Java 9
#
# Can be run also on Windows from Babun shell as follows:
#    ./start_eclipse4.7.1-java9.sh
#

../env.sh

export JAVA_OPTS="${HTTP_PROXY} -Duser.home=$USER_HOME"

export ECLIPSE_HOME="/a/Eclipse/eclipse4.7.1a-oxygen_1a-RC1-win32-x86_64_mitJ9"
export ECLIPSE="${ECLIPSE_HOME}/eclipse"
export ECLIPSE_OPT="-showlocation -vmargs -Xms128M -Xmx512M -XX:+AggressiveOpts -Xverify:none -Duser.home=${HOME}"
export ECLIPSE_WORKSPACE=.
    
${ECLIPSE} -data ${ECLIPSE_WORKSPACE} ${ECLIPSE_OPT}
