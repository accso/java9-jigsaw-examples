# Environment settings

# configure paths here
JAVA_HOME=TODO/path/to/java9-jdk/goes/here
GRAPHVIZ_HOME=TODO/path/to/graphviz2.38/goes/here
MAVEN_HOME=TODO/path/to/Maven3.5.0/goes/here
DEPVIS_HOME=TODO/path/to/depvis/goes/here
ECLIPSE_HOME=TODO/path/to/eclipse4.7.1.a/goes/here

# \; on Windows (even when in bash), : on Un*x
PATH_SEPARATOR=TODO

# ---------------------------------------------------------
# no need to change anything beyond this line

PATH=$JAVA_HOME/bin:$MAVEN_HOME/bin:$PATH

# helper echo to highlight errors on the terminal
function myecho {
    egrep --color=always "Error|error|Exception|exception|Warn|warn|$" $@
}
