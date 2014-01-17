#!/bin/bash
# source properties file
. ./config/newrelic.properties

while true
do
	echo `date`" Getting number of logged in users"
	noOfUsers=$(who | cut -d' ' -f1 | sort | uniq | wc -l | awk '{print "noOfUsers="$NF}')
	resultCode=$?

    if [ $resultCode -eq 0 ]
    then

		echo -e "$noOfUsers" > ./data/values
		
		# source values
		. ./data/values
		noOfUsers=$((noOfUsers+0))
	
		# rm curl data from last execution
		rm -f ./data/curl.data
	
		# take the value from query and populate the curl file sent to New Relic
		while read line
		do
	    	eval echo "$line" >> ./data/curl.data
		done < "./data/curl.data.template"

	    echo "curl -vi $protocol://platform-api.newrelic.com/platform/v1/metrics -H \"X-License-Key: $license\" -H \"Content-Type: application/json\" -H \"Accept: application/json\" -X POST -d '@./data/curl.data'" |bash
    
	else
		echo `date`" Query response was not understood"
	fi
    
    sleep 1800
done