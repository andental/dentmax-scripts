#!/bin/bash

transformed=`cat "$1" | tail -n +2 | tail -r | tail -n +2 | tail -r`

echo "$transformed" | termsql -d ";" --show-header "SELECT col4 As Code,col5 As Name,(col8 / col6) As UnitPrice,SUM(col6) As TotalPerformances FROM tbl GROUP BY col4 order by TotalPerformances desc"
