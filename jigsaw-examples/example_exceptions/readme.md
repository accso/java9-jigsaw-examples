# Java 9 Jigsaw modules example suite
## Example example_exceptions

### Info
Written by [Martin Lehmann](https://github.com/mrtnlhmnn), [Kristine Schaal](https://github.com/kristines) and [Rüdiger Grammes](https://github.com/rgrammes) 

see https://github.com/accso/java9-jigsaw-examples

## What is this example about?

### Modules in this example
* modb, modmain
* modmain has a Main class which is started in run.sh

### Module Dependency Graph, created with [DepVis](https://github.com/accso/java9-jigsaw-depvis)
![Example's Module Dependency Graph](moduledependencies.png)

### Example shows ...
- Handling of exception and transferring them from one module to another.
- Both Exceptions and RuntimeExceptions are used.
- Both cases of exported and non-exported exceptions are shown.
- Chaining of non-exported Exceptions and RuntimeExceptions is shown.
