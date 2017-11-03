. ../env.sh

mvn --version --fail-at-end 2>&1
mvn -s mvn_settings.xml clean --fail-at-end 2>&1
