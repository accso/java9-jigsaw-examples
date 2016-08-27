# Java 9 Jigsaw modules example suite
# Example example_splitpackage

### Info
Written by [Martin Lehmann](https://github.com/MartinLehmann1971), [Kristine Schaal](https://github.com/kristines) and Rüdiger Grammes.

see https://github.com/accso/java9-jigsaw-examples

## What is this example about?

### Modules in this example
* modb, modmain, modmainbar, modsplitbar1, modsplitbar2, modmainfoo, modsplitfoo1, modsplitfoo2
* modmain has a Main class which is started in run.sh

### Module Dependency Graph, created via [DepVis](https://github.com/accso/java9-jigsaw-depvis)
![Example's Module Dependency Graph](/moduledependencies.png)

### Example shows ...
TODO

Fall 1)
modsplitfoo1 und modsplitfoo2 haben beide das Package pkgfoo 
modmainfoo requires modsplitfoo1 und modsplitfoo2
-> Kompiliert nicht: ein Modul darf kein requires auf zwei Module besitzen, die das gleiche Package exportieren

Fall 2) 
modsplitbar1 und modsplitbar2 haben beide das Package pkgbar
modmainbar requires modsplitbar1
Mit -addmods with modsplitbar2 dazugeladen
-> Laufzeitfehler: in einem Classloader duerfen keine zwei Module geladen werden, die das gleiche Package besitzen


END TODO

### TODOs
- [ ] Funktioniert Fall 2, wenn der Classloader fuer modsplitbar1 und modsplitbar2 unterschiedlich sind?
