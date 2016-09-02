# Java 9 Jigsaw modules example suite
## Example example_test

### Info
Written by [Martin Lehmann](https://github.com/MartinLehmann1971), [Kristine Schaal](https://github.com/kristines) and Rüdiger Grammes.

see https://github.com/accso/java9-jigsaw-examples

## What is this example about?

### Modules in this example
* modfib (contains the code to be tested), modtest.blackbox, modtest.whitebox
* No Main class, JUnit is started instead in the run scripts.
* There are separate scripts to compile and run the whitebox and blackbox tests.

### Module Dependency Graph, created via [DepVis](https://github.com/accso/java9-jigsaw-depvis)
![Example's Module Dependency Graph](moduledependencies.png)

### Example shows ...
Example for Testing
- Blackbox testing
- Whitebox testing

For blackboxtesting, the test classes can be managed in a separate module. Only the public interface of modfib has to be accessed in a blackbox test.

In a whitebox test, the internal classes of modfib are subject to tests and therefore must be accessible by test classes. In this example, we use the patch feature. 
Test classes are patched into modfib when compiling the test classes and when starting the tests.
Advantages:
* modfib does not have to export internal classes to a test module (neither statically in the module-info nor during compile or runtime via --add-exports).
* test code can be separated from operational code and is therefore not  deployed to any operational environment.

### See also 
Examples [example_whitebox-test-exports](../example_whitebox-test-exports), [example_patch](../example_patch)
