#!/bin/bash

transformed=`cat "$1" | tail -n +2 | tail -r | tail -n +2 | tail -r`

echo "Patient Cash Report:"
echo "$transformed" | termsql -d ";" "SELECT col3,SUM(col10) As TotalPrice FROM tbl GROUP BY col3 order by TotalPrice desc"


echo ""
echo "Daily Cash Report:"
echo "$transformed" | termsql -d ";" "SELECT date(col2),COUNT(col10) As Performances,SUM(col10) As DailyPrice FROM tbl GROUP BY col2"

echo ""
echo "Monthly Cash Report:"
echo "$transformed" | termsql -d ";" "SELECT date(col2,'start of month'),COUNT(col10) As Performances,SUM(col10) As DailyPrice FROM tbl GROUP BY date(col2,'start of month')"
