#!/bin/sh

set -e
DB_USER=crackdetectionuser
DATABASE=crackdetection

while getopts "cm:di:" arg; do
  case $arg in
    c)
    	# creating table
		psql -c "DROP DATABASE $DATABASE" > /dev/null 2>&1 || test $? -eq 1
		psql -c "CREATE DATABASE $DATABASE" > /dev/null
		psql -c "CREATE USER $DB_USER WITH PASSWORD 'user'" > /dev/null 2>&1 || test $? -eq 1 
		psql -c "ALTER ROLE $DB_USER SET client_encoding TO 'utf8'" > /dev/null
		psql -c "ALTER ROLE $DB_USER SET default_transaction_isolation TO 'read committed'" > /dev/null
		psql -c "ALTER ROLE $DB_USER SET timezone TO 'UTC'" > /dev/null
		psql -c "GRANT ALL PRIVILEGES ON DATABASE $DATABASE TO $DB_USER" > /dev/null
		echo "Success!"
      ;;
    m)
    	export SHARE_DIR=$OPTARG
    	./manage.py makemigrations
    	./manage.py migrate --run-syncdb
    	./manage.py createsuperuser
      ;;
    d)
		pg_dump -U $DB_USER -Fc $DATABASE > $HOME/dbexport.pgsql     
		realpath $HOME/dbexport.pgsql                                                                                                        
      ;;
    i)
    	# import database
    	psql -c "CREATE USER $DB_USER WITH PASSWORD 'user'" > /dev/null 2>&1 || test $? -eq 1 
    	psql -c "DROP DATABASE $DATABASE" > /dev/null 2>&1 || test $? -eq 1
		psql -c "CREATE DATABASE $DATABASE" > /dev/null
    	pg_restore -d $DATABASE $OPTARG -c -U $DB_USER || test $? -eq 1 && echo "Success"
  esac
done
