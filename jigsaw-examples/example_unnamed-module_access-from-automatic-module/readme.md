﻿# Java 9 Jigsaw modules example suite
## Example example_unnamed-module_access-from-automatic-module

### Info
Written by [Martin Lehmann](https://github.com/mrtnlhmnn), [Kristine Schaal](https://github.com/kristines) and [Rüdiger Grammes](https://github.com/rgrammes) 

see https://github.com/accso/java9-jigsaw-examples

## What is this example about?
This example is about the access to the unnamed module, i.e. to the classpath from an automatic module.

### Modules in this example
* modmain.auto - an automatic module calling classes on the classpath.
* cpa - classes on the classpath

### Example shows ...
The examples illustrates the accessibility rules access to the classpath (i.e. in the unnamed module) from automatic modules.
In this example, we show that classes from an automatic module (and only them!) can access all classes from the classpath (the unnamed module) both directly and via reflection. 
This means that all packages from the unnamed module are implicitly exported and opened to automatic modules.

The script run.sh starts the main class from `modmain.auto`.

Note: No JavaDoc generation for this example.
