 # Java 9 Jigsaw modules example suite
## Example example_patch

### Info
Written by [Martin Lehmann](https://github.com/MartinLehmann1971), [Kristine Schaal](https://github.com/kristines) and [Rüdiger Grammes](https://github.com/rgrammes) 

see https://github.com/accso/java9-jigsaw-examples

## What is this example about?

### Modules in this example
* Modules: momain, modb
* In addition, a directory modb-patch
* modmain has a Main class which is started in run.sh (without patch) or run-patch.sh (with patch)

### Module Dependency Graph, created via [DepVis](https://github.com/accso/java9-jigsaw-depvis)
![Example's Module Dependency Graph](moduledependencies.png)

### Example shows ...
It is possible to patch a module (during compile- and runtime). Use cases e.g.:
* Whithebox testing: Unit tests need access to internal classes of a package. See [example-test](../example_test) for details.
* Fixing a bug in a third party lib: Prior to modules, it was possible to do this by correct order on the classpath - put the patch iahead of the classes to be patched.

To patch a module, the patching code is compiled resp. started "as if" it were part of a module. The classes of the patch are added to the module (here modb), 
resp. overwrite existing classes inside the module if the module already contains a class with the same name.
See scripts compile-patch, resp. run-patch for details on the options to use.

Note: No JavaDoc generation for this example
