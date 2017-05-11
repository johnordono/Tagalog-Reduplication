#!/bin/bash

#In File - 	Argument 1
#This file includes all the links that you would like to strip characters from.
INFILE=$1 
#Temp File - Argument 2
#Holds all contents of links.
TEMPFILE=$2
#Out File - Argument 3
#Holds list of words with reduplication.
OUTFILE=$3

cat $INFILE | tr -d '\r' |
while read y
do
	echo `wget -qO- $y >> $TEMPFILE`
done	
echo `perl -i.bak -pe 's/[^[:ascii:]]//g' $TEMPFILE`
cat $TEMPFILE | tr -d '\r' | tr -d '­' | egrep "<p>" | sed 's/<\/p>//g' | sed 's/<p>//g' | tr '[A-Z]' '[a-z]' | sed 's/­//g' | sed 's/[.,><?!\/]//g' | sed 's/ /\n/g' | egrep -v '[0123456789]' |
while read x
do
	#echo "Test"
	WORD=`echo $x | tr -d '\n' | tr -d '\r'`
	#echo $WORD
	REVWORD=`echo $x | tr -d '\n' | tr -d '\r' | rev`
	#echo $REVWORD
	SIZE=${#WORD}
	#echo $SIZE
	HALF=$(($SIZE/2))
	#echo $HALF
	for((i=0;i<$HALF;i++))	
	do
		FIRSTSTART=0
		#echo "First Start" $FIRSTSTART
		FIRSTEND=$((2+i))
		#echo "First End" $FIRSTEND
		LENGTH=$((i+2))
		SECT1=`echo ${WORD:FIRSTSTART:LENGTH}`
		#echo 'First Sect' $SECT1
		SECT2=`echo ${WORD:FIRSTEND:LENGTH}`
		#echo 'Second Sect' $SECT2
		SECT1REV=`echo ${REVWORD:FIRSTSTART:LENGTH}`
		#echo 'First Sect Rev' $SECT1REV
		SECT2REV=`echo ${REVWORD:FIRSTEND:LENGTH}`		
		#echo 'Second Sect Rev' $SECT2REV
		if [ "$SECT1" = "$SECT2" ];then
			echo "Reduplication found (At beginning)" $WORD
			echo $WORD >> $OUTFILE
			break
		fi
		if [ "$SECT1REV" = "$SECT2REV" ];then
			echo "Reduplication found (At end)" $WORD
			echo $WORD >> $OUTFILE
			break
		fi
	done
done