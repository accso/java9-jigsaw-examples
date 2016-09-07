package pkgx;

import java.lang.reflect.Layer;

import pkglayer.LayerHierarchy;

public class X {
    public String doIt() {
        Layer myLayer = this.getClass().getModule().getLayer();
        String layerName  = LayerHierarchy.getLayerName(myLayer);
        String layerLevel = LayerHierarchy.getLayerLevel(myLayer);

        return "\t" + this.toString() + " [ " + X.class
            + ", module " + this.getClass().getModule().getName() 
            + ", layer '" + layerName + "' on level '" + layerLevel + "' (" + myLayer + ") ]";
    }
}
