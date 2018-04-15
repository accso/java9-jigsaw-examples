# Java 9 Jigsaw modules example suite
## Example example_uses-provides_uses-in-client

### Info
Written by [Martin Lehmann](https://github.com/mrtnlhmnn), [Kristine Schaal](https://github.com/kristines) and [Rüdiger Grammes](https://github.com/rgrammes) 

see https://github.com/accso/java9-jigsaw-examples

## What is this example about?

### Modules in this example
* modmain, modservicedefinition, modserviceimplementation1, modserviceimplementation2
* modmain has a Main class which is started in run.sh

### Module Dependency Graph, created with [DepVis](https://github.com/accso/java9-jigsaw-depvis)
![Example's Module Dependency Graph](moduledependencies.png)

### Example shows ...
- Usage of uses und provides
- This example is the same as example_uses-provides but the `uses` statement is not in modservicedefinition but in modmain! (So `uses ...` and the interface are not in the same module.)
