. ../env.sh

mvn --version --fail-at-end 2>&1

# debug mode with -X flag
# mvn -s mvn_settings.xml -X install --fail-at-end 2>&1
mvn -s mvn_settings.xml install --fail-at-end 2>&1