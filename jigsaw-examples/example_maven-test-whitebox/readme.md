# Java 9 Jigsaw modules example suite
## Example example_maven_test-whitebox

### Info
Written by [Martin Lehmann](https://github.com/mrtnlhmnn), [Kristine Schaal](https://github.com/kristines) and [R�diger Grammes](https://github.com/rgrammes) 

see https://github.com/accso/java9-jigsaw-examples

## What is this example about?

### Modules in this example
* modmain, and org.apache.commons.lang3 from a maven dependency
* modmain has a Main class which is started in `run.sh`

### Example shows ...
- Compilation, test compilation and execution with Maven
- Whitebox test via patching the module `modmain` with classes in `src/test/`java

The Maven compile plugin and the surefire plugin now use the patch options to compile and run test classes as part of the module to be tested. For an example using the patch options explicitly, see [here](https://github.com/accso/java9-jigsaw-examples/tree/master/jigsaw-examples/example_test)
It finds out that the patch options are needed because there is no `module-info.java` in `src/main/test`. It then parses the module name from the `module-info.java` in `src/main/java`.

Note: No Eclipse support for this example, just clean/compile/run via scripts
Note: No JavaDoc generation for this example

### Setup
You might want to edit the Maven settings file `mvn_settings.xml` according to your needs (proxies, local repository path etc.) 
The file provided here is just a copy of the original file from Maven 3.5.2 distribution.

### Maven plugins
- A maven-compiler-plugin (version >= 3.6.2) is needed (because we need the new patch options)
- Note that the maven-compiler-plugin (version 3.6.2) currently has a bug ("syntax error") when there are comments in the `module-info.java`
- The current surefire-plugin does not yet support modules. It runs tests in classpath mode.
