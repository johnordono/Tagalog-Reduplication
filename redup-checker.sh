#!/bin/bash
cat TestCases.txt | tr -d '\r' | sed 's/[0123456789.,-<>;:]//g' |
while read x
do
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
			#echo "Reduplication found (At beginning)" $WORD
			echo $WORD >> TestOutput.txt
			break
		fi
		if [ "$SECT1REV" = "$SECT2REV" ];then
			#echo "Reduplication found (At end)" $WORD
			echo $WORD >> TestOutput.txt
		fi
	done
done