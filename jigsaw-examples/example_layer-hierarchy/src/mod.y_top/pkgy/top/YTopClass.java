package pkgy.top;

import java.lang.reflect.Layer;

import pkglayer.LayerHierarchy;

public class YTopClass {
    
    public String doIt() {
        Layer myLayer = this.getClass().getModule().getLayer();
        String layerName  = LayerHierarchy.getLayerName(myLayer);
        String layerLevel = LayerHierarchy.getLayerLevel(myLayer);

        return "\t" + this.toString() + " [ " + YTopClass.class
            + ", module " + this.getClass().getModule().getName() 
            + ", layer '" + layerName + "' on level '" + layerLevel + "' (" + myLayer + ") ]";
    }
}
