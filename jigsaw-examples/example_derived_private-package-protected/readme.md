# Java 9 Jigsaw modules example suite
## Example example_derived_private-package-protected

### Info
Written by [Martin Lehmann](https://github.com/mrtnlhmnn), [Kristine Schaal](https://github.com/kristines) and [Rüdiger Grammes](https://github.com/rgrammes) 

see https://github.com/accso/java9-jigsaw-examples

## What is this example about?
statuc vs. dynamic type

### Modules in this example
* modb, modmain
* modmain has a Main class which is started in run.sh

### Module Dependency Graph, created with [DepVis](https://github.com/accso/java9-jigsaw-depvis)
![Example's Module Dependency Graph](moduledependencies.png)

### Example shows ...
Type visibility:
DataFactory in the exported package pkgb of modb returns (from different create methods) 
* Data as Data (from pkgb). Visible in modmain.
* InternalData (from pkgbinternal which is not exported) as Data. Visible in modmain as Data. Acts as InternalData (keeps its type), but only methods from Data are visible. E.g. a cast to InternalData would not work in modmain.
* InternalData as InternalData. May be called from modmain, as long as the type InternalData is not used. Some static methods (e.g. getName) may even be called, other like toString not. Not really obvious why.
