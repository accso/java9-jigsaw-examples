. ../env.sh

# Config properties file
PROPS_FILENAME=depvis.properties

# Name of the dot file produced by JigsawDepVisualizer
DOT_OUTPUTFILENAME=$(grep outputFileName ${PROPS_FILENAME} | sed s/'depvis.outputFileName='//g | sed s/'.dot'/''/g)
DOT_OUTPUTFILENAME_LEGEND=${DOT_OUTPUTFILENAME}-withlegend

# run the module dependency visualizer (producing a GraphViz dot file)
echo "Running JigsawDepVisualizer to produce ${DOT_OUTPUTFILENAME}.dot and ${DOT_OUTPUTFILENAME_LEGEND}.dot"
$JAVA_HOME/bin/java --module-path ${DEPVIS_HOME}/mlib${PATH_SEPARATOR}${DEPVIS_HOME}/amlib --module depvis/depvis.JigsawDepVisualizer ${PROPS_FILENAME}

# ... and then run GraphViz to render to a image file
IMAGE_OUTPUTFORMAT=png

echo "Running Graphviz to produce ${DOT_OUTPUTFILENAME}.${IMAGE_OUTPUTFORMAT} and ${DOT_OUTPUTFILENAME_LEGEND}.${IMAGE_OUTPUTFORMAT}"
${GRAPHVIZ_HOME}/bin/dot -T${IMAGE_OUTPUTFORMAT} ${DOT_OUTPUTFILENAME}.dot        -o ${DOT_OUTPUTFILENAME}.${IMAGE_OUTPUTFORMAT}
${GRAPHVIZ_HOME}/bin/dot -T${IMAGE_OUTPUTFORMAT} ${DOT_OUTPUTFILENAME_LEGEND}.dot -o ${DOT_OUTPUTFILENAME_LEGEND}.${IMAGE_OUTPUTFORMAT}
