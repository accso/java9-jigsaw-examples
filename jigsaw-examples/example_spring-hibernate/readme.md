# Java 9 Jigsaw modules example suite
## Example example_spring-hibernate 

### Info
Written by [Martin Lehmann](https://github.com/mrtnlhmnn), [Kristine Schaal](https://github.com/kristines) and [Rüdiger Grammes](https://github.com/rgrammes) 

see https://github.com/accso/java9-jigsaw-examples

## <span style="color:red">THIS EXAMPLE IS CURRENTLY BROKEN WHEN USING JDK10</span>
Details see end of this readme.

## What is this example about?
* Running a Spring Boot application with Java9.
* Using modules

### Modules in this example
* currently only module mod.app, containing the main class (the SpringBootApplication to be startet by Spring Boot)

### Module Dependency Graph, created with [DepVis](https://github.com/accso/java9-jigsaw-depvis)
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
* Nicolas Frankel's DZone articles [Migrating a Spring Boot App to Java 9: Compatibility](https://dzone.com/articles/migrating-a-spring-boot-application-to-java-9-comp) and [Migrating a Spring Boot App to Java 9 (Part 2): Modules](https://dzone.com/articles/migrating-a-spring-boot-app-to-java-9-modules)

### Current status: Example is broken

... because of an problem :

<pre>
> $JAVA_HOME/bin/java --version
openjdk 11.0.3 2019-04-16 LTS
OpenJDK Runtime Environment Corretto-11.0.3.7.1 (build 11.0.3+7-LTS)
OpenJDK 64-Bit Server VM Corretto-11.0.3.7.1 (build 11.0.3+7-LTS, mixed mode)

> . ./compile.sh
Apache Maven 3.6.1 (d66c9c0b3152b2e69ee9bac180bb8fcc8e6af555; 2019-04-04T21:00:29+02:00)
Maven home: U:\Common_Env\maven\apache-maven-3.6.1
Java version: 11.0.3, vendor: Amazon.com Inc., runtime: U:\Common_Env\jdk\jdk11.0.3_7
Default locale: de_DE, platform encoding: Cp1252
OS name: "windows 10", version: "10.0", arch: "amd64", family: "windows"
[INFO] Error stacktraces are turned on.
[INFO] Scanning for projects...
[INFO] ------------------------------------------------------------------------
[INFO] Reactor Build Order:
[INFO]
[INFO] mod.app                                                            [jar]
[INFO] example_spring-hibernate                                           [pom]
[INFO]
[INFO] ----------< de.accso.jigsaw.example_spring-hibernate:mod.app >----------
[INFO] Building mod.app 0.0.1-SNAPSHOT                                    [1/2]
[INFO] --------------------------------[ jar ]---------------------------------
[INFO]
[INFO] --- maven-resources-plugin:3.1.0:resources (default-resources) @ mod.app ---
[INFO] Using 'UTF-8' encoding to copy filtered resources.
[INFO] Copying 1 resource
[INFO] Copying 0 resource
[INFO]
[INFO] --- maven-compiler-plugin:3.8.1:compile (default-compile) @ mod.app ---
[INFO]
[INFO] --< de.accso.jigsaw.example_spring-hibernate:example_spring-hibernate >--
[INFO] Building example_spring-hibernate 0.0.1-SNAPSHOT                   [2/2]
[INFO] --------------------------------[ pom ]---------------------------------
[INFO]
[INFO] --- maven-install-plugin:2.4:install (default-install) @ example_spring-hibernate ---
[INFO] Installing J:\java9-jigsaw-examples\jigsaw-examples\example_spring-hibernate\src\pom.xml to u:\Common_Env\.home\.m2\de\accso\jigsaw\example_spring-hibernate\example_spring-hibernate\0.0.1-SNAPSHOT\example_spring-hibernate-0.0.1-SNAPSHOT.pom
[INFO] ------------------------------------------------------------------------
[INFO] Reactor Summary for example_spring-hibernate 0.0.1-SNAPSHOT:
[INFO]
[INFO] mod.app ............................................ FAILURE [  1.781 s]
[INFO] example_spring-hibernate ........................... SUCCESS [  0.156 s]
[INFO] ------------------------------------------------------------------------
[INFO] BUILD FAILURE
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  2.283 s
[INFO] Finished at: 2019-06-05T12:31:04+02:00
[INFO] ------------------------------------------------------------------------
[ERROR] Failed to execute goal org.apache.maven.plugins:maven-compiler-plugin:3.8.1:compile (default-compile) on project mod.app: Execution default-compile of goal org.apache.maven.plugins:maven-compiler-plugin:3.8.1:compile failed: this_class should be module-info -> [Help 1]
org.apache.maven.lifecycle.LifecycleExecutionException: Failed to execute goal org.apache.maven.plugins:maven-compiler-plugin:3.8.1:compile (default-compile) on project mod.app: Execution default-compile of goal org.apache.maven.plugins:maven-compiler-plugin:3.8.1:compile failed: this_class should be module-info
    at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:215)
    at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:156)
    at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:148)
    at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:117)
    at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:81)
    at org.apache.maven.lifecycle.internal.builder.singlethreaded.SingleThreadedBuilder.build (SingleThreadedBuilder.java:56)
    at org.apache.maven.lifecycle.internal.LifecycleStarter.execute (LifecycleStarter.java:128)
    at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:305)
    at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:192)
    at org.apache.maven.DefaultMaven.execute (DefaultMaven.java:105)
    at org.apache.maven.cli.MavenCli.execute (MavenCli.java:956)
    at org.apache.maven.cli.MavenCli.doMain (MavenCli.java:288)
    at org.apache.maven.cli.MavenCli.main (MavenCli.java:192)
    at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
    at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
    at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
    at java.lang.reflect.Method.invoke (Method.java:566)
    at org.codehaus.plexus.classworlds.launcher.Launcher.launchEnhanced (Launcher.java:282)
    at org.codehaus.plexus.classworlds.launcher.Launcher.launch (Launcher.java:225)
    at org.codehaus.plexus.classworlds.launcher.Launcher.mainWithExitCode (Launcher.java:406)
    at org.codehaus.plexus.classworlds.launcher.Launcher.main (Launcher.java:347)
Caused by: org.apache.maven.plugin.PluginExecutionException: Execution default-compile of goal org.apache.maven.plugins:maven-compiler-plugin:3.8.1:compile failed: this_class should be module-info
    at org.apache.maven.plugin.DefaultBuildPluginManager.executeMojo (DefaultBuildPluginManager.java:148)
    at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:210)
    at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:156)
    at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:148)
    at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:117)
    at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:81)
    at org.apache.maven.lifecycle.internal.builder.singlethreaded.SingleThreadedBuilder.build (SingleThreadedBuilder.java:56)
    at org.apache.maven.lifecycle.internal.LifecycleStarter.execute (LifecycleStarter.java:128)
    at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:305)
    at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:192)
    at org.apache.maven.DefaultMaven.execute (DefaultMaven.java:105)
    at org.apache.maven.cli.MavenCli.execute (MavenCli.java:956)
    at org.apache.maven.cli.MavenCli.doMain (MavenCli.java:288)
    at org.apache.maven.cli.MavenCli.main (MavenCli.java:192)
    at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
    at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
    at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
    at java.lang.reflect.Method.invoke (Method.java:566)
    at org.codehaus.plexus.classworlds.launcher.Launcher.launchEnhanced (Launcher.java:282)
    at org.codehaus.plexus.classworlds.launcher.Launcher.launch (Launcher.java:225)
    at org.codehaus.plexus.classworlds.launcher.Launcher.mainWithExitCode (Launcher.java:406)
    at org.codehaus.plexus.classworlds.launcher.Launcher.main (Launcher.java:347)
Caused by: java.lang.module.InvalidModuleDescriptorException: this_class should be module-info
    at jdk.internal.module.ModuleInfo.invalidModuleDescriptor (ModuleInfo.java:1092)
    at jdk.internal.module.ModuleInfo.doRead (ModuleInfo.java:209)
    at jdk.internal.module.ModuleInfo.read (ModuleInfo.java:132)
    at java.lang.module.ModuleDescriptor.read (ModuleDescriptor.java:2508)
    at org.codehaus.plexus.languages.java.jpms.BinaryModuleInfoParser.parse (BinaryModuleInfoParser.java:35)
    at org.codehaus.plexus.languages.java.jpms.AbstractBinaryModuleInfoParser.getModuleDescriptor (AbstractBinaryModuleInfoParser.java:84)
    at org.codehaus.plexus.languages.java.jpms.LocationManager.resolvePaths (LocationManager.java:127)
    at org.apache.maven.plugin.compiler.CompilerMojo.preparePaths (CompilerMojo.java:238)
    at org.apache.maven.plugin.compiler.AbstractCompilerMojo.execute (AbstractCompilerMojo.java:792)
    at org.apache.maven.plugin.compiler.CompilerMojo.execute (CompilerMojo.java:187)
    at org.apache.maven.plugin.DefaultBuildPluginManager.executeMojo (DefaultBuildPluginManager.java:137)
    at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:210)
    at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:156)
    at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:148)
    at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:117)
    at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:81)
    at org.apache.maven.lifecycle.internal.builder.singlethreaded.SingleThreadedBuilder.build (SingleThreadedBuilder.java:56)
    at org.apache.maven.lifecycle.internal.LifecycleStarter.execute (LifecycleStarter.java:128)
    at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:305)
    at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:192)
    at org.apache.maven.DefaultMaven.execute (DefaultMaven.java:105)
    at org.apache.maven.cli.MavenCli.execute (MavenCli.java:956)
    at org.apache.maven.cli.MavenCli.doMain (MavenCli.java:288)
    at org.apache.maven.cli.MavenCli.main (MavenCli.java:192)
    at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
    at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
    at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
    at java.lang.reflect.Method.invoke (Method.java:566)
    at org.codehaus.plexus.classworlds.launcher.Launcher.launchEnhanced (Launcher.java:282)
    at org.codehaus.plexus.classworlds.launcher.Launcher.launch (Launcher.java:225)
    at org.codehaus.plexus.classworlds.launcher.Launcher.mainWithExitCode (Launcher.java:406)
    at org.codehaus.plexus.classworlds.launcher.Launcher.main (Launcher.java:347)
[ERROR]
[ERROR] Re-run Maven using the -X switch to enable full debug logging.
[ERROR]
[ERROR] For more information about the errors and possible solutions, please read the following articles:
[ERROR] [Help 1] http://cwiki.apache.org/confluence/display/MAVEN/PluginExecutionException

</pre>
