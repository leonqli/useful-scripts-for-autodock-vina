#!/usr/bin/env bash

if (( $# != 2 )); then
        echo "Usage: ./logs2csv log_folder out.csv"
        exit 1
fi

log_folder=$1 # folder containing docking logs of autodock vina
out=$2

temp=$(mktemp)
for log in `ls $log_folder/*`
do
        ligname=`basename $log | cut -d'.' -f1`
        score=`grep '^   1' $log | awk '{print $2}'`
        echo $ligname, $score >>$temp
        sort -t, -k2 -n $temp > $out
done
rm $temp
