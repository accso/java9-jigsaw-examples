# Java 9 Jigsaw modules example suite
## Example example_addReads_addExports_reflection

### Info
Written by [Martin Lehmann](https://github.com/MartinLehmann1971), [Kristine Schaal](https://github.com/kristines) and Rüdiger Grammes.

see https://github.com/accso/java9-jigsaw-examples

## What is this example about?

### Modules in this example
* modb, modmain
* modmain has a Main class which is started in run.sh

### Module Dependency Graph, created via [DepVis](https://github.com/accso/java9-jigsaw-depvis)
![Example's Module Dependency Graph](/example_addReads_addExports_reflection/moduledependencies.png)

### Example shows ...
TODO

- addReads via reflection

modmain/Main adds a read relationship to modb dynamically via 
reflection

- addExports via reflection

modb/pkgbinternal is also exported to modmain via reflection. 
For that, modmain/Main asks the (exported!) pkgb.BHelper to do 
this addExports. Adding cannot be done in modmain/Main directly, 
as the reflection method is caller-sensitive!

Note that for getting all compiled, modmain/Main needs access 
to the exported BHelper. Same thing during runtime.

END TODO
