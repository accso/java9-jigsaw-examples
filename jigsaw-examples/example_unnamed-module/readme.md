# Java 9 Jigsaw modules example suite
## Example example_unnamed-module

### Info
Written by [Martin Lehmann](https://github.com/MartinLehmann1971), [Kristine Schaal](https://github.com/kristines) and [Rüdiger Grammes] (https://github.com/rgrammes) 

see https://github.com/accso/java9-jigsaw-examples

## What is this example about?

### Modules in this example
* modb, modmain, and also classes for the unnamed module (cpb, cpmain)
* modmain and cpmain each contain a Main class which are started in run.sh

### Module Dependency Graph, created via [DepVis](https://github.com/accso/java9-jigsaw-depvis)
![Example's Module Dependency Graph](moduledependencies.png)

### Example shows ...
The examples illustrates the accessibility rules access to and from the classpath (i.e. in the unnamed module).
The Main class in modmain cannot access classes from the unnamed module (does not compile),
whereas the Main class in cpmain can access to all classes, both from the named modules (but only if the corresponding packages are exported) and from the unnamed module.

The script run.sh starts both main classes, from modmain and from cpmain.
