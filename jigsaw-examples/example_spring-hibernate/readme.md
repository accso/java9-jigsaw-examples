# Java 9 Jigsaw modules example suite
## Example example_spring-hibernate

### Info
Written by [Martin Lehmann](https://github.com/MartinLehmann1971), [Kristine Schaal](https://github.com/kristines) and [Rüdiger Grammes](https://github.com/rgrammes) 

see https://github.com/accso/java9-jigsaw-examples

## What is this example about?
* Running a Spring Boot application with Java9.
* Using modules

### Modules in this example
* currently only module mod.app, containing the main class (the SpringBootApplication to be startet by Spring Boot)

### Module Dependency Graph, created via [DepVis](https://github.com/accso/java9-jigsaw-depvis)
TODO

### Example shows ...
A Java 9 application, using Spring and Hibernate, based on Spring Boot 2.0.0M5.
There are clean-, compile- and run scripts to build and start tests, resp. to run the application.

Currently work in progress. Below see the steps we did so far to get this state:
- Spring Boot application, with one module (`mod.app`) containing only the (empty) SpringBootApplication.
- Compiles and tests ok with Java 9  
- Runs with Java 9, but only on the class path. Can be started via the Maven `spring-boot-plugin`, or as fat jar via CLI.

#### Step A: Preparing the project, Bootstrap with Java 8
1. Configured and downloaded our application with the [Spring initializr](http://start.spring.io) using Spring Boot 2.0.0 M5, to be run with maven. We included 
   - Security for authentication and authorization
   - Jersey for REST services
   - JPA persistence
   - H2 database

Now the application starts with Java 8.

#### Step B: Prepare for Java 9 - without modules
2. To compile and test, the Maven surefire plugin version 2.20.1 is needed. `java.xml.bind` has to be added as module for test: `--add-modules java.xml.bind` 
3. We use the `spring-boot:run` goal to run the application (see `run.sh`). The argument `--add-modules java.xml.bind` has to be configured here, too.
4. We created a Eclipse project structure (including the m2e plugin).
5. We introduced the Eclipse project `mod.app`. It contains the `SpringBootApplication`
6. To get this compiled, we had to drop `jersey` (commented out in `pom.xml`. Otherwise we ran into problems with `asm` (version conflict with the asm version the compiler needs). 
7. The compiler needs a dependency to `asm-6.0`. So we had to exclude the `asm` version from `plexus-java` (which wants `asm-6.0-BETA`) and set it explicitely for the compiler.

The application now compiles, tests and runs with Java 9.

#### Step C: Introducing a JPMS / Jigsaw module
8. We converted `mod.app`into a module by adding a `module-info`.
9. We then needed to solve more bytecode enhancement issues. Therefore we declared the main class explicitely in the `spring-boot:run-plugin`. This avoids letting Spring Boot search a main class itself, see https://github.com/spring-projects/spring-boot/issues/10647
10. Resolving a `javassist` problem by using the newest version 3.22.0-GA, see https://stackoverflow.com/questions/46132019/java-io-ioexception-invalid-constant-type-19-at-5

The application now compiles, tests and runs with Java 9 and with a `module-info.java`. Note that both tests and launch are still done on the classpath.

### TODOs, LOP, Backlog, Ideas, ...
No software is ready, ever ;-) So here are some ideas left (any other feedback very welcome!):

- [ ] Introduce more modules
- [ ] Run application on the module path
- [ ] Introduce own entities for JPA persistence
- [ ] Introduce own Spring beans

### Related work
* Nicolas Frankel's DZone article [Migrating a Spring Boot App to Java 9: Compatibility](https://dzone.com/articles/migrating-a-spring-boot-application-to-java-9-comp)
