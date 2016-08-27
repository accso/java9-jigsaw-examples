# Java 9 Jigsaw modules example suite
## Example example_addReads_addExports

### Info
Written by [Martin Lehmann](https://github.com/MartinLehmann1971), [Kristine Schaal](https://github.com/kristines) and Rüdiger Grammes.

see https://github.com/accso/java9-jigsaw-examples

## What is this example about?

### Modules in this example
* modb, modc, modmain
* modmain has a Main class which is started in run.sh

### Module Dependency Graph, created via [DepVis](https://github.com/accso/java9-jigsaw-depvis)
![Example's Module Dependency Graph](/example_addReads_addExports/moduledependencies.png)

### Example shows ...
... how to use --add-reads and --add-exports for javac compiler and java launcher

All module-info.java files are empty. All is done in compile.sh and run.sh in command-line options --add-reads and --add-exports for javac and java.
a) modb needs a read relationship to modc
b) modc needs to export its package pkgc to modb
c) modmain needs a read relationship to modb
d) modb needs to exports it package pkgb to modmain
