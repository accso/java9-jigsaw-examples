# Java 9 Jigsaw modules example suite

### Info
Written by [Martin Lehmann](https://github.com/MartinLehmann1971), [Kristine Schaal](https://github.com/kristines) and Rüdiger Grammes.

see https://github.com/accso/java9-jigsaw-examples

### What is this about?
This is a example suite for Java 9 jigsaw modules. Many aspects of the new Java 9 Jigsaw modules as defined in 
[Project Jigsaw](http://openjdk.java.net/projects/jigsaw/) by [JSR 376]
(https://www.jcp.org/en/jsr/detail?id=376) and [JEP 261](http://openjdk.java.net/jeps/261). 

### Setup
1. Clone this repo.
2. Install a Java 9 JDK with Jigsaw support. DepVis has been tested with b127 as of July 2016.
3. Install GraphViz 2.38.
4. If running on Windows, install a bash, like for example [Babun](https://babun.github.io/)
5. Edit file `env.sh` to configure `JAVA_HOME` and `GRAPHVIZ_HOME` and DEPVIS_HOME (see TODO markers)
6. Also edit file `env.sh` to configure the path separator. If run on Windows, use \; (a blackslash quoting a ;)
   If run on Un*x, use a : (a colon).
7. Call one of the scripts on the top level, i.e. one of 
   `allclean.sh`, `allcompile.sh`, `allcreatevis.sh` and `allrun.sh` (or `all.sh` for all in one step).
8. Alternatively, cd to one of the examples and call one of the scripts there (again `all.sh` for all in one step).

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
9. A few examples do compile "old-style" without modules. Results to `example_.../classes`.
10. If a modules is patches, then the .class files for the patch are in `example_.../patches`. Corresponding JAR files are in `example_.../patchlib`.

### TODOs, LOP, Backlog, Ideas, ...
No software is ready, ever ;-) So here are some ideas left (any other feedback very welcome!):

- [ ] Update to newest build (b132 as the time of writing)
- [ ] Do a bit of renaming and refactoring of module names. modmain had been moda before, so that's why most modules are called modb, modc, ...

### Related projects
DepVis, see https://github.com/accso/java9-jigsaw-depvis : Visualization tool for Jigsaw modules
