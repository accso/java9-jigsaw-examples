# Java 9 Jigsaw modules example suite

# Info
Written by [Martin Lehmann](https://github.com/MartinLehmann1971), [Kristine Schaal](https://github.com/kristines) and [Rüdiger Grammes](https://github.com/rgrammes) 

see https://github.com/accso/java9-jigsaw-examples

## What is this about?
This is a example suite for Java 9 jigsaw modules. Many aspects of the new Java 9 Jigsaw modules as defined in 
[Project Jigsaw](http://openjdk.java.net/projects/jigsaw/) by [JSR 376](https://www.jcp.org/en/jsr/detail?id=376) and [JEP 261](http://openjdk.java.net/jeps/261). 

All the examples have been successfully tested with Windows (64bit), Linux and MacOSX - running Java 9.01. Eclipse projects can be used with Eclipse Oxygen.1 4.7.1a.
The three Maven examples need Maven 3.5.2 and the Gradle example needs Gradle 4.2.1.

# Setup
1. Clone this repo.
2. Install a Java 9 JDK with Jigsaw support. All examples have been tested with Java 9 build 181 and also with 9.0.1-11 (both on Windows 10, x64) 
3. Install [GraphViz 2.38](http://www.graphviz.org/).
4. Install [Maven 3.5.2](https://maven.apache.org/download.cgi). Note that this is needed for `example_maven`, `example_maven_blackbox` and `example_maven_whitebox` only.
5. If running on Windows, install a bash, like for example [Babun](https://babun.github.io/)
6. To generate the GraphViz graphs, you also need to clone and compile [depvis](https://github.com/accso/java9-jigsaw-depvis).
7. Edit file `env.sh` to configure `JAVA_HOME` and `JAVA_HOME_JDK8` and `GRAPHVIZ_HOME` and `MAVEN_HOME` and `GRADLE_HOME` and `DEPVIS_HOME` (see TODO markers)
8. Also edit file `env.sh` to configure the path separator. If run on Windows, use \; (a blackslash quoting a ;). If you run all stuff on *nix, use a colon : .
9. Call one of the scripts on the top level, i.e. one of 
   `allclean.sh`, `allcompile.sh`, `allcreatevis.sh` and `allrun.sh` (or `all.sh` for all in one step).
10. Alternatively, cd to one of the examples and call one of the scripts there (again `all.sh` for all in one step).

Note that all scripts have been tested with bash only. There might be minor issues with the *.sh scripts whenever they call each other.
To be sure, you should use all of these clean, compile, run, test etc. scripts in a bash.

## Overall conventions
1. Scripts in top level directory all*.sh call the corresponding scripts recursively
2. Scripts in each example are all.sh, clean.sh, compile*.sh, run*.sh
3. Script createvis.sh in each example creates a GraphViz visualiation, see https://github.com/accso/java9-jigsaw-depvis
4. Eclipse project files are included. Per convention: one module == one Eclipse project. 
   Putting them all in one workspace will _not_ work, because their names, i.e. Eclipse project names, do overlap which is not allowed in one workspace.
5. Source files are in `example_.../src`. That's the module-source-path.
6. Compiled .class files go to `example_.../mods`. 
7. JAR files go to `example_.../mlib`. That's the module-path when run.
8. Third-party JAR files are in `example_.../amlib`. That's also the module-path, in this case containing automatic modules.
9. A few examples do compile "old-style" without modules. Results go to `example_.../classes`.
10. If a module is patched, then the .class files for the patch are in `example_.../patches`. Corresponding JAR files are in `example_.../patchlib`.

# TODOs, LOP, Backlog, Ideas, ...
No software is ready, ever ;-) So here are some ideas left (any other feedback very welcome!):

- [ ] Add more JavaDoc gen scripts. Not trivial as JavaDoc needs *all* exports for all modules in one call!
- [ ] Do a bit of renaming and refactoring of module names. (modmain had been moda before, so that's why most modules are called modb, modc, ...)
- [ ] example for open modules
- [ ] example for Java agents

# Example Overview
| **Examples on the declaration of modules**|**Description**| **Related Examples**|
|--|--|--|
| example_naming-modules                                          | Which naming conventions exist for modules? Which names are not allowed? | 
| example_annotations                                             | How can one specify annotations and deprecation for modules? |
| **Examples on basic module reads and exports attributes**|**Description**| **Related Examples**|
| example_requires_exports_requires-transitive_exports-to         | How does requires, requires transitive and qualified exports look like? | all other examples in this section
| example_requires-static                                         | How does requires static look like? | all other examples in this section
| example_requires_exports                                        | How does requires and exports look like? | all other examples in this section
| example_requires_exports-to                                     | How does requires and qualified exports look like? | all other examples in this section
| example_reflection                                              | How do reflection calls look like? | all other examples in this section
| **Examples on accessibility and (non) exported packages**|**Description**| **Related Examples**|
| example_derived_private-package-protected                       | What happens, when classes / packages in a module are exported, but their sub/super classes are not? | all other examples in this section
| example_exceptions                                              | What happens, when exceptions are thrown to classes outside the module but their package is not exported? | all other examples in this section
| example_interface-callback                                      | What happens, when outside the module a callback implementation is called which package is not exported? | all other examples in this section
| **Examples on specificing add\* options**|**Description**| **Related Examples**|
| example_addExports_manifest                                     | How can we use --add-exports in a manifest file for the Java launcher? | all other examples in this section
| example_addReads_addExports                                     | How can we use --add-reads and --add-exports for Javac compiler and Java launcher | all other examples in this section
| example_addReads_addExports_reflection                          | How can we use --add-reads and --add-exports for reflection calls? |all other examples in this section
| **Examples on automatic modules**|**Description**| **Related Examples**|
| example_automatic-module-logging                                | How to automatic modules (for logging) look like? | example_splitpackage_automatic-modules | example_splitpackage_automatic-modules
| **Examples on restricting the access to resources in other modules**|**Description**| **Related Examples**|
| example_resources                                               | Which resources in modules are accessible, which are not? | 
| **Examples on the split package problem**|**Description**| **Related Examples**|
| example_splitpackage                                            | What happens when one has a split package problem at compile / at runtime? | all other examples in this section
| example_splitpackage_automatic-modules                          | What happens when one Automatic Module automatically reads all other Automatic Modules on the module path and hence creates an unwanted split package problem? | example_automatic-module-logging, all other examples in this section
| **Examples on resolution of modules, layers and visibility of modules between layers**|**Description**| **Related Examples**|
| example_jerrymouse                                              | How can a "app server" JerryMouse (sic!) load and start modules, as a kind of module starter/container? | all other examples in this section
| example_resolved-modules                                        | Which modules are resolved? Usage of jlink | all other examples in this section
| example_layer-hierarchy                                         | How can one create a hiearchy of layers automatically and add modules (via naming conventions)? | all other examples in this section
| example_layer-modules-all-in-boot-layer                         | How does the boot layer look like containing a bunch of modules? | all other examples in this section
| example_layer-modules-grouped-in-hierarchy                      | How does a small hiearchy of layers look like when one explicitely distributes a bunch of modules to these layers? | all other examples in this section
| **Examples on testing**|**Description**| **Related Examples**|
| example_test                                                    | How can one achieve blackbox and whitebox testing? | all other examples in this section
| example_maven-test-blackbox                                     | How can one achieve blackbox testing with Maven? | all other examples in this section
| example_maven-test-whitebox                                     | How can one achieve whitebox testing with Maven? | all other examples in this section
| example_patch                                                   | How can we patch a module at compile / runtime? | all other examples in this section
| **Examples on Main classes**|**Description**| **Related Examples**|
| example_hiddenmain                                              | Is it possible that one can call a Main class which is in a non-exported package? | 
| **Examples on access from and to the classpath (i.e. the unnamed module)**|**Description**| **Related Examples**|
| example_unnamed-module_access-from-automatic-module             | Can a Automatic Module access the classpath (i.e. the unnamed module)? | all other examples in this section
| example_unnamed-module_access-from-explicit-module              | Can a Explicit Module access the classpath (i.e. the unnamed module)? | all other examples in this section
| example_unnamed-module_access-from-explicit-module-reflection   | Can a Explicit Module access the classpath (i.e. the unnamed module) via reflection? | all other examples in this section
| example_unnamed-module-reflection-illegal-access                | Can the classpath (i.e. the unnamed module) access concealed packages in the JDK and what happens when the JDK "kill switch" is activated? |all other examples in this section
| example_unnamed-module_accessing-module-path                    | Can the classpath (i.e. the unnamed module) access modules on the module path? | all other examples in this section
| **Examples on build systems**|**Description**| **Related Examples**|
| example_gradle-project                                          | How can one use Gradle 4.2.1 for building a modularized project? | all other examples in this section
| example_maven-project                                           | How can one use Maven 3.5.2 for building a modularized project? | all other examples in this section
| **Examples on porting applications from Java8 to Java9**|**Description**| **Related Examples**|
| example_spring-hibernate                                        | How does the migration of a Spring Boot application with a bunch of Maven plugins look like and where do we have to tweak / change in comparison to Java 8? |
| example_compile-target-jdk8                                     | What happens when one compiles with JDK9 with or without targeting a Java release 9 or 8? |
 

# Latest Changes

### Cleanup
All kinds of scripts, code, environment settings etc. were checked and lots of cleanup was done. Nothing critical but looks "fresher" now.
Some changes:
- Maven 3.7.0 compiler plugin used now in all maven projects
- Refactoring of the maven test examples: New name is now `example_maven-test-blackbox` and `example_maven-test-whitebox`
- Maven settings template file checked to all maven projects
- Gradle build without the daemon
- Gradle environment variable GRADLE_USER_HOME introduced, as $HOME is not handled correctly on cygwin systems
- Refactoring of the example which shows that automatic modules can access the classpath, now in `example_unnamed-module_access-from-automatic-module`
- All scripts' calls to java, javac, jar etc. now redirected STDERR to STDOUT to make sure that both standard and error output are printed in order (otherwise some exception output is printed very early and now below the call as expected)
- Cleanup of Eclipse dependencies and Build paths whereever possible (not easy when e.g. a mixture of explicit modules and/or automatic modules and/or classpath code has to be built in Eclipse)
- Cleanup of Eclipse launch files (and also renamed them not to have any whitespace in their .launch file name)
- All kind of cleanup like better comments, a bit more separating whitespaces or separating lines in the output
- Deleted `example_example_requires-transitive_exports` (obsolete as all of its contents is covered by `example_requires_exports_requires-transitive_exports-to` already)

### Migration to Java 9.0.1 (Release)
No changes necessary

### Upgrade to DepVis 0.3
Now with print and visualization output like printing uses and provides, printing concealed packages, showing opens and opens-to etc. See [DepVis Readme](https://github.com/accso/java9-jigsaw-depvis) for details

### New and enhanced examples
- `example_unnamed-module-reflection-illegal-access` is new, shows the usage of the "kill switch"
- `example_requires-static` is new, shows the usage of the "requires static"

### Enhanced examples
- `example_resources` is fixed, now works as expected
- Various other cleanups, refactorings, corrections all over the place
- `example_jerry-mouse` limits its apps to a whitelist and only uses them, if they work
- All examples which can be used as an app in `example_jerry-mouse`: Its `modmain` is now an "open module" (instead of "opens pkgmain")

### Migration to b181 (Release)
- --patch-module replaces -Xmodule for javac
- Upgrade maven-compiler-plugin to 3.6.2
- Adapted to new automatic module name algorithm

### Migration to b162
- changes in API (java.lang.reflect.Module is now java.lang.Module, java.lang.reflect.Layer is now java.lang.ModuleLayer)

### Migration to b156
- changes in API (Configuration.resolve instead of Configuration.resolveRequires)
- no more java.compact1 profile available (was used in example_resolved-modules)
- all javac calls now use -Xlint
- note that compiler and launcher now show various warnings (not sure if this is because of b156 or because of "javac -Xlint")

### Migration to b148
- no changes necessary, everything seems still to work as in b144

### Migration to b144
- "opens" instead of "exports dynamic" and "weak modules"
- "requires transitive" instead of "requires public"

# Related projects
DepVis, see https://github.com/accso/java9-jigsaw-depvis : Visualization tool for Jigsaw modules
