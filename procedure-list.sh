#!/bin/bash

transformed=`cat "$1" | tail -n +2 | tail -r | tail -n +2 | tail -r`

echo "$transformed" | termsql -d ";" "SELECT col4,col5,SUM(col6) As TotalPerformances FROM tbl GROUP BY col4 order by TotalPerformances desc"
