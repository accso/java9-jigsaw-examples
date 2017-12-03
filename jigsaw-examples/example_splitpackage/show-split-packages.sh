. ../env.sh

for FILE in $(ls mlib/*.jar); do 
   $JAVA_HOME/bin/jar tf $FILE | sed s/" \+"/" "/g | cut -d " " -f 9 | xargs -i echo "{} $FILE" ; 
done | grep -v META-INF | grep -v ".class" | sort 
