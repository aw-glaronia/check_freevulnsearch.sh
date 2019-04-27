#!/bin/bash
####
#	Author:		Andreas Walker <a.walker@glaronia.ch>
#	Date:		27-Apr-2019
#	Version:	0.0.1
#	License:	GPL
####

#Initiating Variables
HOST=$1
LEVEL=$2

#Die if host variable is empty

if [ -z "$HOST" ];
	then
	echo "UNKNOWN - host not defined"
	exit 3
	fi

#Store NMAP-Output as Variable
NMAP=$(nmap -sV --script freevulnsearch $HOST)

#Filter and count CVE- Lines
CVE=$(echo "$NMAP" | grep "CVE-")
VULN=$(echo "$NMAP" | grep -c "CVE-")
CRIT=$(echo "$NMAP" | grep -c "Critical")
MED=$(echo "$NMAP" | grep -c "Medium")
LOW=$(echo "$NMAP" | grep -c "Low")

#Assemble DIAG Variable
if [[ "$LEVEL" == "v" ]];
	then
	DIAG=$(echo "$NMAP" | tr "|" "!")
	fi

if [[ "$LEVEL" == "f" ]];
	then
	DIAG=$(echo "$CVE" | tr "|" "!")
	fi

#Return OK if no vulnerabilities found.
if [ $VULN == 0 ];
	then
echo "OK - No vulnerabilities found | critical=$CRIT;;1 medium=$MED;1;30 low=$LOW;1;50"
	echo "$DIAG"
 	exit 0 
fi

#Return Critical if Critical vulnerabilities found.
if [ $CRIT != 0 ];
	then
	echo "CRITICAL - $HOST: $VULN vulnerabilities found | critical=$CRIT;;1 medium=$MED;1;30 low=$LOW;1;50"
	echo "$CRIT Critical / $MED Medium / $LOW low"
       	echo "$DIAG"
	exit 2
fi
#Return Warning if Medium vulnerabilities found.
if [ $MED != 0 ];
then echo "WARNING - $HOST: $VULN vulnerabilities found | critical=$CRIT;;1 medium=$MED;1;30 low=$LOW;1;50"
	echo "$CRIT Critical / $MED Medium / $LOW low"
        echo "$DIAG"
	exit 1
fi

#Return Warning if Low vulnerabilities found.
if [ $LOW != 0 ];
	then echo "WARNING - $HOST: $VULN vulnerabilities found | critical=$CRIT;;1 medium=$MED;1;30 low=$LOW;1;50"
	echo "$CRIT Critical / $MED Medium / $LOW low"
        echo "$DIAG"
	exit 1
fi

#End of Script die if you see this
	echo "UNKNOWN - Script came to end without any other output"
	echo "NMAP-OUTPUT"
	echo "$NMAP"
	exit 3
#BYE
