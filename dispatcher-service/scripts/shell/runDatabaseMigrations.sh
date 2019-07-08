#!/bin/sh

BLUECOLOR='\033[0;34;47m'
NOCOLOR='\033[0m' # No Color

echo "Command: ./runDatabaseMigrations.sh url user pass sqlScriptsDirectory"

url=$1
user=$2
pass=$3
sqlScriptsDirectory=$4

mvn -f ../../pom.xml flyway:info -Dflyway.locations=filesystem:${sqlScriptsDirectory} -Dflyway.url=${url} -Dflyway.user=${user} -Dflyway.password=${pass}
mvn -f ../../pom.xml flyway:migrate -Dflyway.locations=filesystem:${sqlScriptsDirectory} -Dflyway.url=${url} -Dflyway.user=${user} -Dflyway.password=${pass}
mvn -f ../../pom.xml flyway:info -Dflyway.locations=filesystem:${sqlScriptsDirectory} -Dflyway.url=${url} -Dflyway.user=${user} -Dflyway.password=${pass}