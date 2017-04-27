#!/bin/bash

while getopts ":h?[help]" option;
do
	case $option in
	h)
		echo "This is a quick and dirty script to measure and log the time it takes to execute a query x amounts of time on a MySQL db or MS SQL db"
	   	echo "usage: script.sh <db type: 'mysql' or 'mssql'> <db username> <db password> <db name> <sql statement> <querynumber> <OPTIONAl: times to execute the query>"
		exit 0
		;;
	?)
		echo "This is a quick and dirty script to measure and log the time it takes to execute a query x amounts of time on a MySQL db."
		echo "usage: script.sh <db username> <db password> <db name> <sql statement> <querynumber> <OPTIONAl: times to execute the query>"
		exit 0
		;;
	esac
done

if [ "$#" -lt "6" ]
then
	echo "You have to enter at least, the type of the db, the name of the db, the user, the password, the SQL-Statement, and the querynumber"
	exit 1
fi

filename="$1"query"$6".csv
if [ -f $filename ]
then
	rm $filename
fi
touch $filename

if [ "$1" == "mysql" ]
then
	echo "hit mysql"
	if [ -z "$7" ]
	then
		for i in {1..50}
		do
			ts=$(date +%s%N) ; mysql -u $2 --password=$3 $4 -e "$5" &>  /dev/null; tt=$((($(date +%s%N) - $ts)/1000000))
			echo $tt >> $filename
		done
	else
		for i in $(seq 1 $7) 
		do
			ts=$(date +%s%N) ; mysql -u $2 --password=$3 $4 -e "$5" &> /dev/null; tt=$((($(date +%s%N) - $ts)/1000000))
			echo $tt >> $filename
		done
	fi
elif [ "$1" == "mssql" ]
then
	echo "hit  mssql"
	if [ -z "$7" ]
	then
		for i in {1..50}
		do
			ts=$(date +%s%N) ; sqlcmd -S localhost -U SA -P $3 -d $4 -i <(echo "$5") > /dev/null; tt=$((($(date +%s%N) - $ts)/1000000))
			echo $tt >> $filename
		done
	else
		for i in $(seq 1 $7) 
		do	
			ts=$(date +%s%N) ; sqlcmd -S localhost -U SA -P $3 -d $4 -i <(echo "$5") > /dev/null; tt=$((($(date +%s%N) - $ts)/1000000))
			echo $tt >> $filename
		done
	fi
fi

