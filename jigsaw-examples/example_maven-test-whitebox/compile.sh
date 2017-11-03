. ../env.sh

mvn --version --fail-at-end

# debug mode with -X flag
# mvn -s mvn_settings.xml -X install --fail-at-end
mvn -s mvn_settings.xml install --fail-at-end