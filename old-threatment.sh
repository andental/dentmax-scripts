#!/bin/bash

transformed=`cat "$1" | tail -n +2 | tail -r | tail -n +2 | tail -r`

year_ago=`date -v-1y +%F`

old_preventive_exams=$(echo "$transformed" | termsql -d ";" --show-header "SELECT COL3 FROM tbl WHERE (COL4='D02' OR COL4='D06') AND (COL1<date('`echo "$year_ago"`'))" | tail -n +2)

echo "$old_preventive_exams" | while read patient ; do
   # echo "=== $patient ==="
   threatmens_in_last_year=$(echo "$transformed" | termsql -d ";" --show-header "SELECT * FROM tbl WHERE COL3='`echo "$patient"`' AND (COL1>date('`echo "$year_ago"`'))" | tail -n +2)
   if ! [ $(echo "$threatmens_in_last_year" | wc -w) -ne 0 ]; then
   		echo "$patient"
   		echo "$transformed" | termsql -d ";" --show-header "SELECT * FROM tbl WHERE COL3='`echo "$patient"`'" | tail -n +2
   		echo ""
	fi
done
