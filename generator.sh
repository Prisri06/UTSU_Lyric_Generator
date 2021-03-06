#!/bin/bash

#SET THESE (VOICEBANK DIRECTORY AND OUTPUT FILE)

while getopts v:o:i: flag 
do
	case "$flag" in
		v) VOICEDIR=${OPTARG} ;;
		o) OUTFILE=${OPTARG} ;;
		i) INFILE=${OPTARG} ;;
		*) echo "invalid argument" ;;
	esac
done

echo "[#VERSION]"
echo "UST Version1.2"
echo "[#SETTING]"
echo "Tempo=125.00"
echo "ProjectName=(no title)"
echo "OutFile=$OUTFILE"
echo "VoiceDir=$VOICEDIR"
echo "Flags="
echo "Mode2=True"

index=0

while read LYRIC
do
	printf "[#%.4d] \n" $index
	echo "Length=480"
	echo "Lyric=$LYRIC"
	echo "NoteNum=60"
	echo "Velocity=100.00"
	echo "StartPoint=0.00"
	echo "Intensity=100"	
	echo "Modulation=0"
	echo "Flags="
	echo "PBS=-40.0,0.0"
	echo "PBW=80.0"
	echo "Envelope=60.0,1.0,1.0,100.0,100.0,100.0,100.0,7.0,60.0,1.0,100.0,0.0"
	echo "VBR=0,0,0,0,0,0,0,0,0,0"
	index=$(( $index+1 ))
done <<< "$(sed 's/ /\n/g' $INFILE)"

echo "[#TRACKEND]"

