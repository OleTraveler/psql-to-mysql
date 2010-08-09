#!/bin/sh

PG_DB=gaiamlife
PG_USERNAME=gaiamlife
PG_PASSWORD=gaiamlife
PG_HOST=localhost


MY_DB=gaiamlife
MY_USERNAME=gaiamlife
MY_PASSWORD=gaiamlife
MY_HOST=localhost



#pg_dump -U ${PG_USERNAME} -h $PG_HOST -F p --no-owner --table=eph* --inserts --attribute-inserts $PG_DB > /tmp/gaiamlife.sql
pg_dump -F p --no-owner --table=eph* --inserts --attribute-inserts $PG_DB > /tmp/gaiamlife.sql

echo "SET sql_mode='ANSI_QUOTES';" > /tmp/gaiamlife-mysql.sql
./pgfix < /tmp/gaiamlife.sql >> /tmp/gaiamlife-mysql.sql


mysql -u $MY_USERNAME -p${MY_PASSWORD} -h $MY_HOST $MY_DB < gaiamlife-mysql.sql



