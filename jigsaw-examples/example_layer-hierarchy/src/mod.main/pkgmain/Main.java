package pkgmain;

import pkglayer.LayerHierarchy;

public class Main {
    public static void main(String[] args) throws Exception {
    	String path;
    	if (args.length == 0) {
    		// no path given? then use current working directory
    		path = new java.io.File(System.getProperty("user.dir")).getAbsolutePath();
    	}
    	else {
    		path = new java.io.File(args[0]).getAbsolutePath();
    	}
    	
        // parse layer JSON file
        LayerBuilder layerBuilder = new LayerBuilder(path + "/layers_triple_hierarchy.json");
        LayerHierarchy.root.addChildLayer(layerBuilder.parseLayerJsonFile(LayerHierarchy.root));
        // System.out.println(LayerHierarchy.root);
        
        // create Jigsaw layers and add modules to them
        layerBuilder.createJigsawLayers(LayerHierarchy.root, LayerHierarchy.root.getLayer(), path + "/mlib");
        LayerHierarchy.printLayerHierarchy(LayerHierarchy.root);
        
        // call module's classes via reflection
        new ModuleCaller().callAllViaReflection(LayerHierarchy.root);
    }
}
