# Java 9 Jigsaw modules example suite
## Example example_compile-target-jdk8

### Info
Written by [Martin Lehmann](https://github.com/MartinLehmann1971), [Kristine Schaal](https://github.com/kristines) and [Rüdiger Grammes](https://github.com/rgrammes) 

see https://github.com/accso/java9-jigsaw-examples

## What is this example about?
This example is about compatibility of code compiled for jdk 8 / 9 and running it with jdk 8

### Modules in this example
* cpmain - classes on the classpath

### Example shows ...
* Code compiled with target jdk 8 runs with jdk 8.
* code compiled for target jdk 9 does NOT run in jdk8: The class version has changed.

To run this example, set a corect jdk 8 in run-jar9-on-jdk8.sh and run-jdk8.sh.

Note: No JavaDoc generation for this example.
