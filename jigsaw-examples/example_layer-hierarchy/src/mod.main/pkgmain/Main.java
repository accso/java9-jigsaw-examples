package pkgmain;

import pkglayer.LayerHierarchy;

public class Main {
    public static void main(String[] args) throws Exception {
        // parse layer JSON file
        LayerBuilder layerBuilder = new LayerBuilder("layers_triple_hierarchy.json");
        LayerHierarchy.root.addChildLayer(layerBuilder.parseLayerJsonFile(LayerHierarchy.root));
        // System.out.println(LayerHierarchy.root);
        
        // create Jigsaw layers and add modules to them
        layerBuilder.createJigsawLayers(LayerHierarchy.root, LayerHierarchy.root.getLayer(), "./mlib");
        LayerHierarchy.printLayerHierarchy(LayerHierarchy.root);
        
        // call module's classes via reflection
        new ModuleCaller().callAllViaReflection(LayerHierarchy.root);
    }
}
