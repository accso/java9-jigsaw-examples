# Environment settings

# configure paths here
# configure paths here
JAVA_HOME=/a/JDK/jdk1.9.0_ea-b127-x64_20160721_build5308
GRAPHVIZ_HOME=/a/GraphViz/graphviz-2.38  
DEPVIS_HOME=j:/github-java9-jigsaw-depvis/depvis
# \; on Windows (even when in bash), : on Un*x
PATH_SEPARATOR=\;

# ---------------------------------------------------------
# no need to change anything beyond this line

PATH=$JAVA_HOME/bin:$PATH  

# helper echo to highlight errors on the terminal
function myecho {
    egrep --color=always "Error|error|Exception|exception|Warn|warn|$" $@
}
