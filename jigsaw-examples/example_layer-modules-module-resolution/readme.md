# Java 9 Jigsaw modules example suite
## Example example_layer-modules-before-finder

### Info
Written by [Martin Lehmann](https://github.com/mrtnlhmnn), [Kristine Schaal](https://github.com/kristines) and [Rüdiger Grammes](https://github.com/rgrammes) 

see https://github.com/accso/java9-jigsaw-examples

## What is this example about?
This example is similar to [this example](https://github.com/accso/java9-jigsaw-examples/tree/master/jigsaw-examples/example_layer-modules-grouped-in-hierarchy).
It shows how a module from the boot layer can be overwritten in a child layer depending on the order of resolution.

### Layers in this example
We have the boot layer as the parent layer for these three child layers:
- `foo layer #1` which contains the module `modfoo` which requires the modules `modversion1` and `modcommon`
- `bar layer #1` which contains the module `modbar` which requires the modules `modversion2` and `modcommon`
- `bar layer #2` which contains the module `modbar` which requires the modules `modversion2` and `modcommon`

The boot layer contains these modules (from mlib/)
- `modcommon` which has standard functionality used by all other modules
- `modmain` which does reflective calls to `modbar` and `modfoo`

The foo layer contains these modules (from foomlib/)
- `modversion1` which produces the version string "V1"
- `modfoo` which prints its id and the version from modversion1

The bar layers contains these modules (from barmlib/)
- `modcommon`, a new version of modcommon found in boot layer. It prints certain texts in blue colour on ANSI terminals.
- `modversion2` which produces the version string "V2"
- `modbar` which prints its id and the version from modversion2

### Example shows ...
This exampe shows how modcommon is resolved differently depending on how a layer is created:
- modmain resolves modcommon from the module path (mlib/), both end up in the boot layer on startup.
- modfoo is placed in the newly created foo-layer together with modversion1. Its "module path" foomlib/ does not contain modcommon so it is resolved from the boot layer. 
- modbar is placed in the newly created bar-layer #1 together with modversion2. barmlib/ does contain a new version of modcommon, however, the boot layer version is found first and is thus used.
- modbar is again played in the newly created bar-layer #2 together with modversion2. This time, we create the layer putting barmlib/ in the so-called "before"-ModuleFinder. Now the new version of modcommon is resolved instead, and we see blue output on ANSI terminals when this version of modbar is called.

Note that using automatic modules in either bar-layer #1 or #2 will lead to failure. An automatic module will try to add reads dependencies to all modules in the bar-layer and in the parent boot layer. In doing this, it tries to read from both modcommon in boot as well as modcommon in bar! This leads to a module resolution error.
