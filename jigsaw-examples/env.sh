# Environment settings

# configure paths here
export JAVA_HOME=TODO/path/to/java9-jdk/goes/here

export GRADLE_HOME=TODO/path/to/Gradle4.2.1/goes/here
export GRADLE_USER_HOME=${HOME}

export ECLIPSE_HOME=TODO/path/to/eclipse4.7.1.a/goes/here

export MAVEN_HOME=TODO/path/to/Maven3.5.2/goes/here
export M2_HOME=${MAVEN_HOME}

export GRAPHVIZ_HOME=TODO/path/to/graphviz2.38/goes/here
export DEPVIS_HOME=TODO/path/to/depvis/goes/here

# \; on Windows (even when in bash), : on Un*x
PATH_SEPARATOR=TODO

# only needed in example_compile-target-jdk8
export JAVA_HOME_JDK8=TODO/path/to/jdk1.8/goes/here


# ---------------------------------------------------------

# export HOME=$HOME

# ---------------------------------------------------------

#
# options used for javac (compile), jar (packaging) and java (launch)
#
JAVAC_OPTIONS="-Xlint"
# JAVA_OPTIONS="-XshowSettings:all -Xlog:module=trace -showversion --show-module-resolution"
JAVA_OPTIONS="-showversion"
JAR_OPTIONS=""
JAVADOC_OPTIONS=""

# ---------------------------------------------------------
# no need to change anything beyond this line

export PATH=$JAVA_HOME/bin:$MAVEN_HOME/bin:$PATH

# helper echo to highlight errors on the terminal
function myecho {
    egrep --color=always "Error|error|Exception|exception|Warn|warn|$" $@
}
