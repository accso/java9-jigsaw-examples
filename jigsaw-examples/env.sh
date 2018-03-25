# Environment settings

# configure paths here

# Path to JDK9 or JDK10 (9.0.1, 9.0.4 and 10_18.3_10+46 have been tested)
export JAVA_HOME=TODO/path/to/java9-or-10-jdk/goes/here

# Path to JDK8, only needed in example_compile-target-jdk8
export JAVA8_HOME=TODO/path/to/java8-jdk/goes/here

# Path to Gradle >=4.2.1 (for JDK9.0.*) or Gradle >= 4.6 (for JDK10)
export GRADLE_HOME=TODO/path/to/Gradle/goes/here
export GRADLE_USER_HOME=${HOME}

# Path to Eclipse 4.7.3 Oxygen.3 (but 4.7.1a Oxygen.1a should still work)
export ECLIPSE_HOME=TODO/path/to/eclipse4.7.3/goes/here

# Path to Maven >=3.5.2
export MAVEN_HOME=TODO/path/to/Maven3.5.2/goes/here
export M2_HOME=${MAVEN_HOME}

# Path to GraphViz >=2.38
export GRAPHVIZ_HOME=TODO/path/to/graphviz2.38/goes/here
# Path to DepVis , see https://github.com/accso/java9-jigsaw-depvis
export DEPVIS_HOME=TODO/path/to/depvis/goes/here

# \; on Windows (even when in bash), : on Un*x
PATH_SEPARATOR=TODO

# ---------------------------------------------------------

# Probably only needed on Windows, in Babun
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
