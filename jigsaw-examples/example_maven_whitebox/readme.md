# Java 9 Jigsaw modules example suite
## Example example_maven_whitebox

### Info
Written by [Martin Lehmann](https://github.com/MartinLehmann1971), [Kristine Schaal](https://github.com/kristines) and [Rüdiger Grammes](https://github.com/rgrammes) 

see https://github.com/accso/java9-jigsaw-examples

## What is this example about?

### Modules in this example
* modmain, and the automatic commons.lang3
* modmain has a Main class which is started in `run.sh`

### Example shows ...
- Compilation, test compilation and execution with Maven
- Whitebox test via patching the module modmain with classes in `src/test/`java
