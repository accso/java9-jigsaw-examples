# Java 9 Jigsaw modules example suite
# Example example_jerrymouse

### Info
Written by [Martin Lehmann](https://github.com/MartinLehmann1971), [Kristine Schaal](https://github.com/kristines) and Rüdiger Grammes.

see https://github.com/accso/java9-jigsaw-examples

## What is this example about?

### Modules in this example
TODO

### Example shows ...
TODO

Laden von Modulen in Layern
============================================================
Starter implementiert einen primitiven App-Server, der modulare Anwendungen im Unterverzeichnis apps/ in einen jeweils 
eigenen Layer unter dem boot-Layer lädt und per Reflection ausfuehrt.

Zu Anforderungen an die modularen Anwendungen und details zur Ablage siehe apps/README.txt 

============================================================


* Anwendungen werden unter apps abgelegt. Jede Anwendung in einem eigenen Verzeichnis "x". Name des Verzeichnis = Name des Anwendungsordners
* Konfiguration der Anwendungs über x/app.json
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
