# Java 9 Jigsaw modules example suite
## Example example_unnamed-exports-opens

### Info
Written by [Martin Lehmann](https://github.com/MartinLehmann1971), [Kristine Schaal](https://github.com/kristines) and [Rüdiger Grammes](https://github.com/rgrammes) 

see https://github.com/accso/java9-jigsaw-examples

## What is this example about?
This example is about the access to the class path from an automatic module.

### Modules in this example
* automodmain - an automatic module calling classes on the class path.
* cpa - classes on the classpath


### Example shows ...
The examples illustrates the accessibility rules access to the classpath (i.e. in the unnamed module) from automatic modules.
In this example, we show that classes from an automatic module can access all classes from the class path (the Unnamed Module) both directly and via reflection. 
This means that all packages from the Unnamed Module are implicitly exported and opened to automatic modules

The script run.sh starts the main class from automodmain.

Note: No JavaDoc generation for this example
