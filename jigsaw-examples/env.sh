# Environment settings

# configure paths here
# JAVA_HOME=/a/JDK/jdk1.9.0_ea-b127-x64_20160721_build5308
# JAVA_HOME=/a/JDK/jdk1.9.0_ea-b132-x64_20160822_build5414
# JAVA_HOME=/a/JDK/jdk1.9.0_ea-b134-x64_20160902_build5456
# JAVA_HOME=/a/JDK/jdk1.9.0_ea-b138-x64_20160929_build5546
# JAVA_HOME=/a/JDK/jdk1.9.0_ea-b144-x64_20161111_build5709
JAVA_HOME=/a/JDK/jdk1.9.0_ea-b148-x64_20161213_build5846
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
