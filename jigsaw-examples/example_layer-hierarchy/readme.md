# Java 9 Jigsaw modules example suite
## Example example_layer-hierarchy

### Info
Written by [Martin Lehmann](https://github.com/MartinLehmann1971), [Kristine Schaal](https://github.com/kristines) and Rüdiger Grammes.

see https://github.com/accso/java9-jigsaw-examples

## What is this example about?

### Modules in this example
* mod.layer contains a layer tree data structure (built up when reading a JSON file like `layers_triple_hierarchy.json`)
* mod.main contains the main class which a) builts up the layers and b) calls the `doIt()` in all modules in all layers

The layer hierarchy as defined in `layers_triple_hierarchy.json` defines the following layer structure:
* layer toplayer on level top
  * layer middlelayer_1 (parent is toplayer) on level middle
    * layer bottomlayer_1a (parent is middlelayer_1) on level bottom
    * layer bottomlayer_1b (parent is middlelayer_1) on level bottom
  * layer middlelayer_2 (parent is toplayer) on level middle
    * layer bottomlayer_2a (parent is middlelayer_2) on level bottom
    * layer bottomlayer_2b (parent is middlelayer_2) on level bottom

All other modules are put automatically to a Jigsaw layer based on their naming convention (module name's suffix matches layer level). See modmain/pkgmain.LayerBuilder.java:
* mod.x_bottom (in layer bottom), mod.x_middle (in layer middle), mod.x_top (in layer top) all have the same package and same class. 
  * Split package problem does not occur. 
  * Note that these mod.x\* modules need to be compiled separately (see compile.sh) as the automatic module javax.json has unfortunately an automatic reads relationship to each of them (so that the split package problem prevents successfuly compile). TODO: Add jigsaw-dev mailing thread link here
* mod.y_bottom (in layer bottom), mod.y_middle (in layer middle), mod.y_top (in layer top) use different packages. 
  * A class in bottom is derived from one in middle which is derived from top.
* mod.z_bottom (in layer bottom), mod.z_middle (in layer middle), mod.z_top (in layer top) use different packages. 
  * Similar to the Y example except that the Z classes are not derived from each other but use delegation (from bottom->middle, from middle->top).
* mod.zreverse_bottom (in layer top), mod.zreverse_middle (in layer top), mod.zreverse_top (in layer top) use different packages. 
  * Similar to the Z example except that the order is "reversed". Because of that, _all_ modules already end up in the top layer, because top requires middle which requires bottom.
* mod.u_bottom_middle_top (in layer top) is a module, which could theoretically end up in all layers but is already resolved in top layer.

### Example shows ...
The example shows how a layer hierarchy can be built up (see `mod.main/pkgmain.LayerBuilder` and `mod.layers/pkglayer.*.java`)
- For that, we use a tree of layers. See mod.layers for our tree data structure. Each of the tree nodes has a name, a level and a reference to a Jigsaw layer.
- The layer tree hiearchy is read from a JSON file.
- Each name of a layer tree node must be unique.
- Modules (mod.u*, mod.x\*, mod.y\*, mod.z\*) are added to the layers (see section "Modules ...").

The example shows also how modules in different layers can interact with each other (see section "Modules ...").

Finally, the examples shows how the class `mod.main/pkgmain.ModuleCaller` (in the Jigsaw boot layer) can call any other class in any other module in the layer hierarchy via reflection.
