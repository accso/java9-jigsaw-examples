# Java 9 Jigsaw modules example suite
## Example example_annotations

### Info
Written by [Martin Lehmann](https://github.com/MartinLehmann1971), [Kristine Schaal](https://github.com/kristines) and [Rüdiger Grammes](https://github.com/rgrammes).

see https://github.com/accso/java9-jigsaw-examples

## What is this example about?

### Modules in this example
* modb, modc, modmain
* modmain has a Main class which is started in run.sh

### Module Dependency Graph, created via [DepVis](https://github.com/accso/java9-jigsaw-depvis)
![Example's Module Dependency Graph](moduledependencies.png)

### Example shows modules with annotations
see [ModuleAnnotations](http://openjdk.java.net/projects/jigsaw/spec/issues/#ModuleAnnotations)

- modmain looks up modules modb and modc and prints their annotations available at runtime
- modb has a deprecated annotation in the module-info.java. 
- modc defines threee annotations with ElementType module, one available at runtime, two only
    available at compile time
