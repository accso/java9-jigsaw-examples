# Java 9 Jigsaw modules example suite
## Example example_maven_blackbox

### Info
Written by [Martin Lehmann](https://github.com/MartinLehmann1971), [Kristine Schaal](https://github.com/kristines) and [Rüdiger Grammes](https://github.com/rgrammes) 

see https://github.com/accso/java9-jigsaw-examples

## What is this example about?

### Modules in this example
* modmain plus automatic commons.lang3
* modmain has a Main class which is started in `run.sh`

### Example shows ...
- Compilation, test compilation and execution with Maven
- Blackbox test with own `module-info.java` in `src/test/java`

The maven compile and surefire plugins recognize the test classes as an own module here, because there is a `module-info.java`

### Maven plugins
- maven-compiler-plugin Version >= 3.6.1 is needed 
- The current surefire-plugin does not yet support modules. It runs tests in classpath mode.
