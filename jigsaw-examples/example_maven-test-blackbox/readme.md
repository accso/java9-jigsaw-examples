# Java 9 Jigsaw modules example suite
## Example example_maven_test-blackbox

### Info
Written by [Martin Lehmann](https://github.com/mrtnlhmnn), [Kristine Schaal](https://github.com/kristines) and [Rüdiger Grammes](https://github.com/rgrammes) 

see https://github.com/accso/java9-jigsaw-examples

## What is this example about?

### Modules in this example
* modmain plus automatic commons.lang3
* modmain has a Main class which is started in `run.sh`

### Example shows ...
- Compilation, test compilation and execution with Maven
- Blackbox test with own `module-info.java` in `src/test/java`

The maven compile and surefire plugins recognize the test classes as an own module here, because there is a `module-info.java`

Note: No Eclipse support for this example, just clean/compile/run via scripts
Note: No JavaDoc generation for this example

### Setup
You might want to edit the Maven settings file `mvn_settings.xml` according to your needs (proxies, local repository path etc.) 
The file provided here is just a copy of the original file from Maven 3.5.2 distribution.

### Maven plugins
- maven-compiler-plugin Version >= 3.6.1 is needed 
- The current surefire-plugin does not yet support modules. It runs tests in classpath mode.
