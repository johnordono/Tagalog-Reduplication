#!/bin/bash

#Word List - 	Argument 1
#This file includes the list of words containing reduplication.
LISTFILE=$1
echo `cat $LISTFILE | sort | uniq -c | sort -r -n`