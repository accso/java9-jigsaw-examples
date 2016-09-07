# Environment settings

# configure paths here
JAVA_HOME=TODO/path/to/java/home/goes/here
GRAPHVIZ_HOME=TODO/path/to/graphviz2.38/home/goes/here
DEPVIS_HOME=TODO/path/to/depvis/goes/here
# \; on Windows (even when in bash), : on Un*x
PATH_SEPARATOR=TODO

# ---------------------------------------------------------
# no need to change anything beyond this line

PATH=$JAVA_HOME/bin:$PATH  

# helper echo to highlight errors on the terminal
function myecho {
    egrep --color=always "Error|error|Exception|exception|Warn|warn|$" $@
}
