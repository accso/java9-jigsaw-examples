#
# Start script for Eclipse 4.7.1a with Java 9
#
# Can be run also on Windows from Babun shell as follows:
#    . ./start_eclipse4.7.1-java9.sh
#

. ../env.sh

# OS specific support (must be 'true' or 'false').
cygwin=false
case "`uname`" in
  CYGWIN* )
    cygwin=true
    ;;
esac
# For Cygwin, switch paths to Windows format before running java
MY_HOME=${HOME}
if $cygwin ; then
    MY_HOME=`cygpath --path --mixed "${HOME}"`
fi
    
export JAVA_OPTS="${HTTP_PROXY} -Duser.home=${MY_HOME}"

export ECLIPSE="${ECLIPSE_HOME}/eclipse"
export ECLIPSE_OPT="-showlocation -vmargs -Xms128M -Xmx512M -XX:+AggressiveOpts -Xverify:none -Duser.home=${MY_HOME}"
export ECLIPSE_WORKSPACE=.

${ECLIPSE} -data ${ECLIPSE_WORKSPACE} ${ECLIPSE_OPT} 1>eclipse.out 2>&1 &
