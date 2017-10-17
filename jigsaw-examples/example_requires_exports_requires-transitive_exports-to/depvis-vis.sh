. ../env.sh

function createvis() {
    # Name of the dot file produced by JigsawDepVisualizer
    DOT_OUTPUTFILENAME=$(grep outputFileName ${1} | sed s/'depvis.outputFileName='//g | sed s/'.dot'/''/g)
    DOT_OUTPUTFILENAME_LEGEND=${DOT_OUTPUTFILENAME}-withlegend

    # run the module dependency visualizer (producing a GraphViz dot file)
    echo "Running JigsawDepVisualizer to produce ${DOT_OUTPUTFILENAME}.dot and ${DOT_OUTPUTFILENAME_LEGEND}.dot"
    $JAVA_HOME/bin/java --module-path ${DEPVIS_HOME}/mlib${PATH_SEPARATOR}${DEPVIS_HOME}/amlib -m depvis/depvis.JigsawDepVisualizer ${1}
	
    # ... and then run GraphViz to render to a image file
    IMAGE_OUTPUTFORMAT=png
	
    echo "Running Graphviz to produce ${DOT_OUTPUTFILENAME}.${IMAGE_OUTPUTFORMAT} and ${DOT_OUTPUTFILENAME_LEGEND}.${IMAGE_OUTPUTFORMAT}"
    ${GRAPHVIZ_HOME}/bin/dot -T${IMAGE_OUTPUTFORMAT} ${DOT_OUTPUTFILENAME}.dot        -o ${DOT_OUTPUTFILENAME}.${IMAGE_OUTPUTFORMAT}
    ${GRAPHVIZ_HOME}/bin/dot -T${IMAGE_OUTPUTFORMAT} ${DOT_OUTPUTFILENAME_LEGEND}.dot -o ${DOT_OUTPUTFILENAME_LEGEND}.${IMAGE_OUTPUTFORMAT}
}


# Config properties file
createvis depvis.properties
createvis depvis-with-facade.properties
