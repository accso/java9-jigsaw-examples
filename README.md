# Java 9 Jigsaw modules example suite

### Info
Written by [Martin Lehmann](https://github.com/MartinLehmann1971), [Kristine Schaal](https://github.com/kristines) and [Rüdiger Grammes](https://github.com/rgrammes) 

see https://github.com/accso/java9-jigsaw-examples

### What is this about?
This is a example suite for Java 9 jigsaw modules. Many aspects of the new Java 9 Jigsaw modules as defined in 
[Project Jigsaw](http://openjdk.java.net/projects/jigsaw/) by [JSR 376](https://www.jcp.org/en/jsr/detail?id=376) and [JEP 261](http://openjdk.java.net/jeps/261). 

### Setup
1. Clone this repo.
2. Install a Java 9 JDK with Jigsaw support. All examples have been tested with Java 9 build 181 and also with 9.0.1-11 (both on Windows 10, x64) 
3. Install [GraphViz 2.38](http://www.graphviz.org/).
4. Install [Maven 3.5.0](https://maven.apache.org/download.cgi). Note that this is needed for example_maven_blackbox and example_maven_whitebox only.
5. If running on Windows, install a bash, like for example [Babun](https://babun.github.io/)
6. To generate the graphviz graphs, you also need to clone and compile [depvis](https://github.com/accso/java9-jigsaw-depvis).
7. Edit file `env.sh` to configure `JAVA_HOME` and `GRAPHVIZ_HOME` and `MAVEN_HOME` and `DEPVIS_HOME` (see TODO markers)
8. Also edit file `env.sh` to configure the path separator. If run on Windows, use \; (a blackslash quoting a ;). If you run all stuff on *nix, use a colon : .
9. Call one of the scripts on the top level, i.e. one of 
   `allclean.sh`, `allcompile.sh`, `allcreatevis.sh` and `allrun.sh` (or `all.sh` for all in one step).
10. Alternatively, cd to one of the examples and call one of the scripts there (again `all.sh` for all in one step).

### Overall conventions
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

### TODOs, LOP, Backlog, Ideas, ...
No software is ready, ever ;-) So here are some ideas left (any other feedback very welcome!):

- [ ] Add JavaDoc gen scripts. Not trivial as JavaDoc needs *all* exports for all modules in one call!
- [ ] Add layer example and check (reflective?) calls up and down the layer hierarchy
- [ ] Check which packages from JARs on the classpath are exposed with "exports" and/or "opens" (probably: all of them, only to Automatic Modules)
- [ ] Do a bit of renaming and refactoring of module names. (modmain had been moda before, so that's why most modules are called modb, modc, ...)
- [ ] add new example on annotation and deprecation of modules
- [ ] example for open modules

### Latest Changes

#### Migration to Java 9.0.1 (Release)
No changes necessary

#### Upgrade to DepVis 0.3
Now with print and visualization output like printing uses and provides, printing concealed packages, showing opens and opens-to etc. See [DepVis Readme](https://github.com/accso/java9-jigsaw-depvis) for details

#### New and enhanced examples
- `example_unnamed-module-reflection-illegal-access` is new, shows the usage of the "kill switch"
- `example_requires-static` is new, shows the usage of the "requires static"

#### Enhanced examples
- `example_resources` is fixed, now works as expected
- Various other cleanups, refactorings, corrections all over the place
- `example_jerry-mouse` limits its apps to a whitelist and only uses them, if they work
- All examples which can be used as an app in `example_jerry-mouse`: Its `modmain` is now an "open module" (instead of "opens pkgmain")

#### Migration to b181 (Release)
- --patch-module replaces -Xmodule for javac
- Upgrade maven-compiler-plugin to 3.6.2
- Adapted to new automatic module name algorithm

#### Migration to b162
- changes in API (java.lang.reflect.Module is now java.lang.Module, java.lang.reflect.Layer is now java.lang.ModuleLayer)

#### Migration to b156
- changes in API (Configuration.resolve instead of Configuration.resolveRequires)
- no more java.compact1 profile available (was used in example_resolved-modules)
- all javac calls now use -Xlint
- note that compiler and launcher now show various warnings (not sure if this is because of b156 or because of "javac -Xlint")

#### Migration to b148
- no changes necessary, everything seems still to work as in b144

#### Migration to b144
- "opens" instead of "exports dynamic" and "weak modules"
- "requires transitive" instead of "requires public"

### Related projects
DepVis, see https://github.com/accso/java9-jigsaw-depvis : Visualization tool for Jigsaw modules
