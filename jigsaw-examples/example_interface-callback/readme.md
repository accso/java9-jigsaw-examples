# Java 9 Jigsaw modules example suite
## Example example_interface-callback

### Info
Written by [Martin Lehmann](https://github.com/mrtnlhmnn), [Kristine Schaal](https://github.com/kristines) and [Rüdiger Grammes](https://github.com/rgrammes)

see https://github.com/accso/java9-jigsaw-examples

## What is this example about?

### Modules in this example
* modcallbackhandler, modcallee, modmain
* modmain has a Main class which is started in run.sh

### Module Dependency Graph, created via [DepVis](https://github.com/accso/java9-jigsaw-depvis)
![Example's Module Dependency Graph](moduledependencies.png)

### Example shows ...
- Calling a callback interface
- Module modcallee defines a callback interface ICallback, which is returned when calling Callee.doIt(). 
- Module modcallbackhandler does implement the interface ICallback
- Module modmain brings Callee and implementation together: Callee can call the implementation of ICallback
