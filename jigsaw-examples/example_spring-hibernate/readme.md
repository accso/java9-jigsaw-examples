# Java 9 Jigsaw modules example suite
## Example example_spring-hibernate

### Info
Written by [Martin Lehmann](https://github.com/MartinLehmann1971), [Kristine Schaal](https://github.com/kristines) and [Rüdiger Grammes](https://github.com/rgrammes) 

see https://github.com/accso/java9-jigsaw-examples

## What is this example about?
* Running a spring boot application with Java9.
* Using modules

### Modules in this example
* currently only module mod.app, containing the main class (the SpringBootApplication to be startet by Spring Boot)

### Module Dependency Graph, created via [DepVis](https://github.com/accso/java9-jigsaw-depvis)

### Example shows ...
A Java 9 application, using spring and hibernate.
There are clean-, compile- and run scripts to build and start tests, resp. the application.

These are the steps we did so far.

#### Preparing the project, Bootstrap with Java 8
1. Configured and downloaded our application with the [Spring initializr] (http://start.spring.io) using Spring Boot 2.0.0 M5, to be run with maven. We included 
   - Security 
   - Jersey 
   - JPA
   - H2
In this configuration, the application started with Java 8.

#### Prepare for Java 9 - without modules
2. To compile and test, the surefire plugin version 2.20.1 is needed. java.xml.bind has to be added as module for test: `--add-modules java.xml.bind` 
3. We use the spring-boot:run goal to run the application (see `run.sh`). The argument `--add-modules java.xml.bind` has to be configured here, woo.
4. We created a module project structure for Eclipse (including the m2e plugin).
5. We introduced the project `mod.app`. It contains the `SpringBootApplication`
6. To get this compiled, we had to drop jersey. Otherwise we ran into problems with asm (version conflict with the asm version the compiler needs). 
7. The compiler  needs a dependency to asm-6.0. So wee have to exclude the asm version from plexus-java (wants asm-6.0-BETA) and set it explicitely for the compiler.
The application now compiles, test runs and runs.

#### Introducing a module
8. We converted `mod.app`into a module by adding a module-info.
9. More byte code enhancement issues. Therefore we declared the main class explicitely in the spring-boot:run-plugin. This avoids letting sprin boot search a main class itself. See https://github.com/spring-projects/spring-boot/issues/10647
10. Rsolving a javassist problem by using the newest version 3.22.0-GA

### Current state 
* spring boot application, with one module (`mod.app`) containing only the (empty) SpringBootApplication.
* compiles and tests ok 
* Runs, but only on the class path. Can be startet via the spring-boot-plugin, or as fat jar via CLI.

