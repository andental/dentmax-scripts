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
V48|Osadenie Kofferdamovej blany.|43
N03|Odstránenie zubného kameňa - 1 sextant|37
A02|Injekčná anestézia|34
V06|L16 Fotokompozit - dve plôšky.|24
V05|L17 Fotokompozit - jedna plôška.|23
N50|Optragate.|18
V07|L25 Fotokompozit - tri plôšky.|16
V31|L46 Paliatívne endodontické ošetrenie|9
V20|L46 Dočasné ošetrenie hlbokého zubného kazu.|8
D02|Preventívna stomatologická prehliadka.|6
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
Podhradská Jana|900.0
Baláž Ondrej|830.0
Rutšek Milan|680.0
Ikerová Anna|645.6
Šinský Matúš|545.5
Horváthová Hana|510.0
Bencko Milan|500.0
Chmeľ Ján|475.0
Kučerová Renáta|440.0
Salak Peter|435.0
Magát Jakub|420.0
Osacká Linda|415.0
Kiko Roman|412.5
Ciferský Ján|390.0
Tinath Samuel|380.0
```