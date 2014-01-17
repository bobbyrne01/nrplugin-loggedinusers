nrplugin-loggedinusers
======================

NewRelic plugin for graphing how many users are logged into a system.
Data is collected every 30 minutes, currently, and sent to NewRelic for graphing.
This is a simple plugin example to demonstrate how easily (any) data can be collected and posted.

# Requirements

* NewRelic account
* Standard linux utilities (bash, curl)
* Access to NewRelic via network (http/s)

# Deployment

Open a terminal, change path to newrelic if different to below:

    NRPLUGIN-LOGGEDINUSERS='/etc/newrelic/'
    cd NRPLUGIN-LOGGEDINUSERS;
    git clone https://github.com/bobbyrne01/nrplugin-loggedinusers.git

# Installation
    
Copy service and log rotation scripts to system directories:

	cd nrplugin-loggedinusers
    cp init.d/nrplugin-loggedinusers /etc/init.d/
    cp logrotate.d/nrplugin-loggedinusers /etc/logrotate.d/
    
Start the service:

    service nrplugin-loggedinusers start
