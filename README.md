# dentmax-scripts

### Convert csv

#### Requirements

- Dentmax xlsx export file
- Libreoffice headless

```sh
./convert-csv.sh ~/Downloads/vykony.xlsx
```

### Procedure list

Get total count of procedure performances from `Export - výkony` from https://zona.dentmax.sk/cash/reports/

####  Requirements

- Dentmax xlsx export file converted as CSV file
- termsql

```sh
./procedure-list.sh vykony.csv
```

#### Example

```
Code|Name|UnitPrice|TotalPerformances
V48|Osadenie Kofferdamovej blany.|15|46
N03|Odstránenie zubného kameňa - 1 sextant|10|39
A02|Injekčná anestézia|10|37
V06|L16 Fotokompozit - dve plôšky.|50|27
V05|L17 Fotokompozit - jedna plôška.|40|25
N50|Optragate.|5|21
V07|L25 Fotokompozit - tri plôšky.|0|17
V31|L46 Paliatívne endodontické ošetrenie|20|9
V20|L46 Dočasné ošetrenie hlbokého zubného kazu.|0|8
D02|Preventívna stomatologická prehliadka.|15|7
```

### Patient report

Get total sum of cash received by patient from `Export - doklady` from https://zona.dentmax.sk/cash/reports/

####  Requirements

- Dentmax xlsx export file converted as CSV file
- termsql

```sh
./patient-report.sh cash_report_doklady.csv
```

#### Example

```
Patient Cash Report:
Name|Performances|Total
Podhradská Jana|10|900.0
Baláž Ondrej|11|830.0
Rutšek Milan|7|680.0
Ikerová Anna|3|645.6
Šinský Matúš|6|545.5
Horváthová Hana|4|510.0
Bencko Milan|5|500.0
Chmeľ Ján|6|475.0
Kučerová Renáta|6|440.0
Salak Peter|7|435.0
Magát Jakub|6|420.0
Osacká Linda|6|415.0
Kiko Roman|6|412.5
Ciferský Ján|1|390.0
Tinath Samuel|2|380.0

Daily Cash Report:
Day|Performances|Total
2020-11-06|1|35.0
2020-11-10|2|105.0
2020-11-11|5|280.0
2020-11-12|6|355.0
2020-11-13|3|195.0
2020-11-16|3|185.0
2020-11-18|3|295.0

Weekly Cash Report:
Week|WorkingDays|Performances|Total
2020-11-02|1|1|35.0
2020-11-09|4|16|935.0
2020-11-16|4|15|1005.0
2020-11-23|5|20|797.5
2020-11-30|5|24|1557.0

Monthly Cash Report:
Month|WorkingDays|Performances|Total
2020-11-01|15|56|3037.5
2020-12-01|19|86|5255.0
2021-01-01|19|85|5535.0

First Visits Daily Report:
Day|FirstVisits
2020-11-06|1
2020-11-10|2
2020-11-11|5
2020-11-12|6
2020-11-13|2
2020-11-16|3
2020-11-18|3

First Visits Weekly Report:
Week|FirstVisits
2020-11-02|1
2020-11-09|15
2020-11-16|9
2020-11-23|18
2020-11-30|18

First Visits Monthly Report:
Month|FirstVisits
2020-11-01|46
2020-12-01|56
2021-01-01|36
```