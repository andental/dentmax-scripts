#!/bin/bash

transformed=`cat "$1" | tail -n +2 | tail -r | tail -n +2 | tail -r`

echo "$transformed" | termsql -d ";" "SELECT col3,SUM(col10) As TotalPrice FROM tbl GROUP BY col3 order by TotalPrice desc"
