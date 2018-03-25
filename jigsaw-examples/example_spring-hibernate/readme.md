# Java 9 Jigsaw modules example suite
## Example example_spring-hibernate

### Info
Written by [Martin Lehmann](https://github.com/mrtnlhmnn), [Kristine Schaal](https://github.com/kristines) and [Rüdiger Grammes](https://github.com/rgrammes) 

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
* Nicolas Frankel's DZone articles [Migrating a Spring Boot App to Java 9: Compatibility](https://dzone.com/articles/migrating-a-spring-boot-application-to-java-9-comp) and [Migrating a Spring Boot App to Java 9 (Part 2): Modules](https://dzone.com/articles/migrating-a-spring-boot-app-to-java-9-modules)

### Current status: Example is broken

... because of a compile problem with JDK 10:

<pre>
> $JAVA_HOME/bin/java --version
java 10 2018-03-20
Java(TM) SE Runtime Environment 18.3 (build 10+46)
Java HotSpot(TM) 64-Bit Server VM 18.3 (build 10+46, mixed mode)

> . ./compile.sh
Compiling example_spring-hibernate
/j/github-java9-jigsaw-examples/jigsaw-examples/example_spring-hibernate
Apache Maven 3.5.2 (138edd61fd100ec658bfa2d307c43b76940a5d7d; 2017-10-18T09:58:13+02:00)
Maven home: C:\Users\lehmann\.m2\wrapper\dists\apache-maven-3.5.2-bin\28qa8v9e2mq69covern8vmdkj0\apache-maven-3.5.2
Java version: 10, vendor: Oracle Corporation
Java home: A:\JDK\jdk10_18.3_10+46_x64
Default locale: de_DE, platform encoding: Cp1252
OS name: "windows 10", version: "10.0", arch: "amd64", family: "windows"
/j/github-java9-jigsaw-examples/jigsaw-examples/example_spring-hibernate
[INFO] Error stacktraces are turned on.
[INFO] Scanning for projects...
[WARNING]
[WARNING] Some problems were encountered while building the effective model for de.accso.jigsaw.example_spring-hibernate:mod.app:jar:0.0.1-SNAPSHOT
[WARNING] 'build.plugins.plugin.(groupId:artifactId)' must be unique but found duplicate declaration of plugin org.springframework.boot:spring-boot-maven-plugin @ line 116, column 12
[WARNING]
[WARNING] It is highly recommended to fix these problems because they threaten the stability of your build.
[WARNING]
[WARNING] For this reason, future Maven versions might no longer support building such malformed projects.
[WARNING]
[INFO] ------------------------------------------------------------------------
[INFO] Reactor Build Order:
[INFO]
[INFO] example_spring-hibernate, mod.app
[INFO] example_spring-hibernate
[INFO]
[INFO] ------------------------------------------------------------------------
[INFO] Building example_spring-hibernate, mod.app 0.0.1-SNAPSHOT
[INFO] ------------------------------------------------------------------------
[INFO]
[INFO] --- maven-resources-plugin:3.0.1:resources (default-resources) @ mod.app ---
[INFO] Using 'UTF-8' encoding to copy filtered resources.
[INFO] Copying 1 resource
[INFO] Copying 0 resource
[INFO]
[INFO] --- maven-compiler-plugin:3.7.0:compile (default-compile) @ mod.app ---
[WARNING] ********************************************************************************************************************
[WARNING] * Required filename-based automodules detected. Please don't publish this project to a public artifact repository! *
[WARNING] ********************************************************************************************************************
[INFO] Changes detected - recompiling the module!
[INFO] Compiling 2 source files to J:\github-java9-jigsaw-examples\jigsaw-examples\example_spring-hibernate\src\mod.app\target\classes
[INFO]
[INFO] --- maven-resources-plugin:3.0.1:resources (default-resources) @ mod.app ---
[INFO] Using 'UTF-8' encoding to copy filtered resources.
[INFO] Copying 1 resource
[INFO] Copying 0 resource
[INFO]
[INFO] --- maven-compiler-plugin:3.7.0:compile (default-compile) @ mod.app ---
[WARNING] ********************************************************************************************************************
[WARNING] * Required filename-based automodules detected. Please don't publish this project to a public artifact repository! *
[WARNING] ********************************************************************************************************************
[INFO] Nothing to compile - all classes are up to date
[INFO]
[INFO] --- maven-resources-plugin:3.0.1:testResources (default-testResources) @ mod.app ---
[INFO] Using 'UTF-8' encoding to copy filtered resources.
[INFO] skip non existing resourceDirectory J:\github-java9-jigsaw-examples\jigsaw-examples\example_spring-hibernate\src\mod.app\src\test\resources
[INFO]
[INFO] --- maven-compiler-plugin:3.7.0:testCompile (default-testCompile) @ mod.app ---
[INFO] Changes detected - recompiling the module!
[INFO] Compiling 1 source file to J:\github-java9-jigsaw-examples\jigsaw-examples\example_spring-hibernate\src\mod.app\target\test-classes
[INFO]
[INFO] --- maven-surefire-plugin:2.20.1:test (default-test) @ mod.app ---
[INFO] Surefire report directory: J:\github-java9-jigsaw-examples\jigsaw-examples\example_spring-hibernate\src\mod.app\target\surefire-reports
[INFO] ------------------------------------------------------------------------
[INFO] Reactor Summary:
[INFO]
[INFO] example_spring-hibernate, mod.app .................. FAILURE [  3.698 s]
[INFO] example_spring-hibernate ........................... SKIPPED
[INFO] ------------------------------------------------------------------------
[INFO] BUILD FAILURE
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 4.118 s
[INFO] Finished at: 2018-03-25T10:54:22+02:00
[INFO] Final Memory: 28M/104M
[INFO] ------------------------------------------------------------------------
[ERROR] Failed to execute goal org.apache.maven.plugins:maven-surefire-plugin:2.20.1:test (default-test) on project mod.app: Execution default-test of goal org.apache.maven.plugins:maven-surefire-plugin:2.20.1:test failed.: NullPointerException -> [Help 1]
org.apache.maven.lifecycle.LifecycleExecutionException: Failed to execute goal org.apache.maven.plugins:maven-surefire-plugin:2.20.1:test (default-test) on project mod.app: Execution default-test of goal org.apache.maven.plugins:maven-surefire-plugin:2.20.1:test failed.
    at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:213)
    at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:154)
    at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:146)
    at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:117)
    at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:81)
    at org.apache.maven.lifecycle.internal.builder.singlethreaded.SingleThreadedBuilder.build (SingleThreadedBuilder.java:51)
    at org.apache.maven.lifecycle.internal.LifecycleStarter.execute (LifecycleStarter.java:128)
    at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:309)
    at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:194)
    at org.apache.maven.DefaultMaven.execute (DefaultMaven.java:107)
    at org.apache.maven.cli.MavenCli.execute (MavenCli.java:955)
    at org.apache.maven.cli.MavenCli.doMain (MavenCli.java:290)
    at org.apache.maven.cli.MavenCli.main (MavenCli.java:194)
    at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
    at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
    at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
    at java.lang.reflect.Method.invoke (Method.java:564)
    at org.codehaus.plexus.classworlds.launcher.Launcher.launchEnhanced (Launcher.java:289)
    at org.codehaus.plexus.classworlds.launcher.Launcher.launch (Launcher.java:229)
    at org.codehaus.plexus.classworlds.launcher.Launcher.mainWithExitCode (Launcher.java:415)
    at org.codehaus.plexus.classworlds.launcher.Launcher.main (Launcher.java:356)
    at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
    at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
    at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
    at java.lang.reflect.Method.invoke (Method.java:564)
    at org.apache.maven.wrapper.BootstrapMainStarter.start (BootstrapMainStarter.java:39)
    at org.apache.maven.wrapper.WrapperExecutor.execute (WrapperExecutor.java:122)
    at org.apache.maven.wrapper.MavenWrapperMain.main (MavenWrapperMain.java:50)
Caused by: org.apache.maven.plugin.PluginExecutionException: Execution default-test of goal org.apache.maven.plugins:maven-surefire-plugin:2.20.1:test failed.
    at org.apache.maven.plugin.DefaultBuildPluginManager.executeMojo (DefaultBuildPluginManager.java:145)
    at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:208)
    at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:154)
    at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:146)
    at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:117)
    at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:81)
    at org.apache.maven.lifecycle.internal.builder.singlethreaded.SingleThreadedBuilder.build (SingleThreadedBuilder.java:51)
    at org.apache.maven.lifecycle.internal.LifecycleStarter.execute (LifecycleStarter.java:128)
    at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:309)
    at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:194)
    at org.apache.maven.DefaultMaven.execute (DefaultMaven.java:107)
    at org.apache.maven.cli.MavenCli.execute (MavenCli.java:955)
    at org.apache.maven.cli.MavenCli.doMain (MavenCli.java:290)
    at org.apache.maven.cli.MavenCli.main (MavenCli.java:194)
    at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
    at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
    at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
    at java.lang.reflect.Method.invoke (Method.java:564)
    at org.codehaus.plexus.classworlds.launcher.Launcher.launchEnhanced (Launcher.java:289)
    at org.codehaus.plexus.classworlds.launcher.Launcher.launch (Launcher.java:229)
    at org.codehaus.plexus.classworlds.launcher.Launcher.mainWithExitCode (Launcher.java:415)
    at org.codehaus.plexus.classworlds.launcher.Launcher.main (Launcher.java:356)
    at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
    at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
    at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
    at java.lang.reflect.Method.invoke (Method.java:564)
    at org.apache.maven.wrapper.BootstrapMainStarter.start (BootstrapMainStarter.java:39)
    at org.apache.maven.wrapper.WrapperExecutor.execute (WrapperExecutor.java:122)
    at org.apache.maven.wrapper.MavenWrapperMain.main (MavenWrapperMain.java:50)
Caused by: java.lang.NullPointerException
    at org.apache.maven.surefire.shade.org.apache.commons.lang3.SystemUtils.isJavaVersionAtLeast (SystemUtils.java:1626)
    at org.apache.maven.plugin.surefire.AbstractSurefireMojo.createSurefireBootDirectoryInTemp (AbstractSurefireMojo.java:2904)
    at org.apache.maven.plugin.surefire.AbstractSurefireMojo.getSurefireTempDir (AbstractSurefireMojo.java:2129)
    at org.apache.maven.plugin.surefire.AbstractSurefireMojo.getForkConfiguration (AbstractSurefireMojo.java:1967)
    at org.apache.maven.plugin.surefire.AbstractSurefireMojo.executeProvider (AbstractSurefireMojo.java:1111)
    at org.apache.maven.plugin.surefire.AbstractSurefireMojo.executeAfterPreconditionsChecked (AbstractSurefireMojo.java:954)
    at org.apache.maven.plugin.surefire.AbstractSurefireMojo.execute (AbstractSurefireMojo.java:832)
    at org.apache.maven.plugin.DefaultBuildPluginManager.executeMojo (DefaultBuildPluginManager.java:134)
    at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:208)
    at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:154)
    at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:146)
    at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:117)
    at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:81)
    at org.apache.maven.lifecycle.internal.builder.singlethreaded.SingleThreadedBuilder.build (SingleThreadedBuilder.java:51)
    at org.apache.maven.lifecycle.internal.LifecycleStarter.execute (LifecycleStarter.java:128)
    at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:309)
    at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:194)
    at org.apache.maven.DefaultMaven.execute (DefaultMaven.java:107)
    at org.apache.maven.cli.MavenCli.execute (MavenCli.java:955)
    at org.apache.maven.cli.MavenCli.doMain (MavenCli.java:290)
    at org.apache.maven.cli.MavenCli.main (MavenCli.java:194)
    at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
    at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
    at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
    at java.lang.reflect.Method.invoke (Method.java:564)
    at org.codehaus.plexus.classworlds.launcher.Launcher.launchEnhanced (Launcher.java:289)
    at org.codehaus.plexus.classworlds.launcher.Launcher.launch (Launcher.java:229)
    at org.codehaus.plexus.classworlds.launcher.Launcher.mainWithExitCode (Launcher.java:415)
    at org.codehaus.plexus.classworlds.launcher.Launcher.main (Launcher.java:356)
    at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
    at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
    at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
    at java.lang.reflect.Method.invoke (Method.java:564)
    at org.apache.maven.wrapper.BootstrapMainStarter.start (BootstrapMainStarter.java:39)
    at org.apache.maven.wrapper.WrapperExecutor.execute (WrapperExecutor.java:122)
    at org.apache.maven.wrapper.MavenWrapperMain.main (MavenWrapperMain.java:50)
[ERROR]
[ERROR] Re-run Maven using the -X switch to enable full debug logging.
[ERROR]
[ERROR] For more information about the errors and possible solutions, please read the following articles:
[ERROR] [Help 1] http://cwiki.apache.org/confluence/display/MAVEN/PluginExecutionException

</pre>
