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

The maven compile and surefire plugin now use the patch options to compile and run test classes as part of the module to be tested. For an example using the patch options explicitly, see [here](https://github.com/accso/java9-jigsaw-examples/tree/master/jigsaw-examples/example_test)
It finds out that the patch options are needed because there is no `module-info.java` in `src/main/test`. It then parses the module name from the `module-info.java` in `src/main/java`.

### Maven plugins
- maven-compiler-plugin Version >= 3.6.2 is needed (only this version uses the new patch-Options)
- Mind that maven-compiler-plugin Version = 3.6.2 currently has a bug ("syntax error") when there are comments in the `module-info.java`
- The current surefire-plugin does not yet support modules. It runs tests in classpath mode.
