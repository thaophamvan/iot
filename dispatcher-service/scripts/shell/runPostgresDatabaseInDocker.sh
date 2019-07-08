#!/bin/sh

BLUECOLOR='\033[0;34;47m'
NOCOLOR='\033[0m' # No Color

echo "Command: ./runPostgresDatabaseInDocker.sh"

db=db
user=user
pass=pass

command="docker run -p 5432:5432 --name db -e POSTGRES_PASSWORD=${pass} -e POSTGRES_USER=${user} -e POSTGRES_DB=${db} -d postgres:10.1"
echo $command
eval $command