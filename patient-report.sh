#!/bin/bash

transformed=`cat "$1" | tail -n +2 | tail -r | tail -n +2 | tail -r`

echo "Patient Cash Report:"
echo "$transformed" | termsql -d ";" --show-header "SELECT col3 As Name,SUM(col10) As Total FROM tbl GROUP BY col3 order by Total desc"


echo ""
echo "Daily Cash Report:"
echo "$transformed" | termsql -d ";" --show-header "SELECT date(col2) As Day,COUNT(col10) As Performances,SUM(col10) As Total FROM tbl GROUP BY col2"

echo ""
echo "Weekly Cash Report:"
echo "$transformed" | termsql -d ";" --show-header "SELECT date(col2,'weekday 0', '-6 days') As Week,COUNT(DISTINCT date(col2)) As WorkingDays,COUNT(col10) As Performances,SUM(col10) As Total FROM tbl GROUP BY date(col2,'weekday 0', '-6 days')"


echo ""
echo "Monthly Cash Report:"
echo "$transformed" | termsql -d ";" --show-header "SELECT date(col2,'start of month') As Month,COUNT(DISTINCT date(col2)) As WorkingDays, COUNT(col10) As Performances,SUM(col10) As Total FROM tbl GROUP BY date(col2,'start of month')"

echo ""
echo "First Visits Daily Report:"
echo "$transformed" | termsql -d ";" --show-header "SELECT Date As Day, Count(Name) As FirstVisits FROM (SELECT date(col2) As Date, col3 As Name FROM tbl GROUP BY Name) GROUP BY Day"

echo ""
echo "First Visits Weekly Report:"
echo "$transformed" | termsql -d ";" --show-header "SELECT Date As Week, Count(Name) As FirstVisits FROM (SELECT date(col2,'weekday 0', '-6 days') As Date, col3 As Name FROM tbl GROUP BY Name) GROUP BY Week"

echo ""
echo "First Visits Monthly Report:"
echo "$transformed" | termsql -d ";" --show-header "SELECT Date As Month, Count(Name) As FirstVisits FROM (SELECT date(col2,'start of month') As Date, col3 As Name FROM tbl GROUP BY Name) GROUP BY Month"
