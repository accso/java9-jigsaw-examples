# Java 9 Jigsaw modules example suite
## Example example_maven_blackbox

### Info
Written by [Martin Lehmann](https://github.com/MartinLehmann1971), [Kristine Schaal](https://github.com/kristines) and [Rüdiger Grammes](https://github.com/rgrammes) 

see https://github.com/accso/java9-jigsaw-examples

## What is this example about?

### Modules in this example
* modmain, moda
* modmain requires moda.

### Example shows ...
- typical structure with maven and two modules.

Dependencies have to be modelled both in the module-info and the pom!

### Setup
You might want to edit the Maven settings file `mvn_settings.xml` according to your needs (proxies, local repository path etc.) 
The file provided here is just a copy of the original file from Maven 3.5.2 distribution.

### Maven plugins
- maven-compiler-plugin Version >= 3.6.1 is needed 
- Note that the JavaDoc generation shows an error for `modmain` (probably caused by [this Maven plugin bug](https://issues.apache.org/jira/browse/MJAVADOC-498))
