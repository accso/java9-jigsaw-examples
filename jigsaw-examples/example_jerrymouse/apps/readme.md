# Java 9 Jigsaw modules example suite
## Example example_jerrymouse (apps)

### Info
Written by [Martin Lehmann](https://github.com/MartinLehmann1971), [Kristine Schaal](https://github.com/kristines) and [Rüdiger Grammes] (https://github.com/rgrammes) 

see https://github.com/accso/java9-jigsaw-examples

## What is this example about?

### Modules in this example
TODO

### Example shows ...
TODO

* Anwendungen werden unter apps abgelegt. Jede Anwendung in einem eigenen Verzeichnis "x". Name des Verzeichnis = Name des Anwendungsordners
* Konfiguration der Anwendungs ueber x/app.json
* Die Module der Anwendung liegen unter x/mods/

z.B.
apps/example_requires_exports
> app.json
apps/example_requires_exports/mods
> modb.jar
> modc.jar
> modmain.jar
apps/example_hiddenmain
> app.json
apps/example_hiddenmain/mods
> ...

* app.json legt das Root-Modul sowie die zu startende Main-Klasse und Methode fest, z.B.:

{
  "rootModule": "modmain",
  "bootClass": "pkgmain.Main",
  "bootMethod": "main"
}
Achtung: "bootMethod" muss statisch sein und String[] als Parameter haben!
END TODO
