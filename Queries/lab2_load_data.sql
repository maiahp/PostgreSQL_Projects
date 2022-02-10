-- Script to populate the SpotMe schema
-- Dev Purandare for CSE 180 Fall 2022


-- Customers(custID, name, streetAddr, city, state, joinDate, level, canReserve)
/* made canReserve false  for Greg Hirsch */
COPY Customers FROM stdin USING DELIMITERS '|';
101|Kendall Roy|123 Main St|New York|NY|2018-01-09|C|FALSE
20|Tom Wambsgans|333 Meder Dr|St. Paul|MN|2011-03-21|A|TRUE
103|Siobhan Roy|9931 El Camino|New York|NY|2020-02-12|A|TRUE
104|Greg Hirsch|831 Santa Cruz|Toronto|ON|2021-06-30|B|FALSE 
111|Roman Roy|123 Main St|New York|NY|2018-01-09|B|TRUE
90|Gerri Kellman|222 Emmet Grade|Newark|NJ|2016-07-31|A|TRUE
831|Stewy Hosseini|11 Private Dr.|New York|NY|2022-01-04|B|FALSE
100|Logan Roy|101 w 34 St|New York|NY|2018-01-09|A|TRUE
883|Berry Schneider|22 Icecream grade|Santa Cruz|CA|2022-01-04|C|FALSE
909|Herry Potter|22 Icecream grade|Santa Cruz|CA|2022-05-02|C|FALSE
884|Berry Schweitzer|22 Icecream grade|Santa Cruz|CA|2022-01-01|A|FALSE
\.


-- Vehicles(state, licensePlate, vehicleType, year, make, color)
COPY Vehicles FROM stdin USING DELIMITERS '|';
NY|FAW3376|C|2018|BMW 7 Series|W|100
FL|FAW3376|C|2018|BMW 7 Series|W|90
CA|DAW3996|C|2020|BMW 5 Series|B|103
NY|MMM1233|C|2019|Tesla M|R|101
NJ|EAW7776|C|2010|Toyota Prius C|G|104
ON|CSE0180|C|2022|Audi V8|B|831
NY|FMW3376|C|2018|Lexus C|G|100
FL|FAW4376|C|2018|Toyota Camry|B|90
CA|DAWW996|C|2021|Chevy Camaro|R|883
NY|MMM1333|C|2021|Tesla Roadster|R|101
NJ|EAW9976|C|2010|Toyota Prius|G|20
ON|CSE1180|C|2022|Ford F150|B|20
CA|FAWW476|C|2021|Ford F150|R|909
CA|DAWW995|C|2021|Toyota Camry|R|884
\.

-- ParkingLots(parkingLotID, streetAddr, city, state, numSpots, costPerHour)
COPY ParkingLots FROM stdin USING DELIMITERS '|';
1033|980 11th Ave N|New York|NY|600|10.25
2077|1002 11th Ave S|New York|NY|10|199.2
2451|114 Center St|Santa Cruz|CA|60|1.25
9762|1167 El Camino|San Francisco|CA|200|4.45
777|1 West Drive|Toronto|ON|10|0
779|3 West Drive|Toronto|ON|100|5
778|2 West Drive|Toronto|ON|100|2.25
\.

-- Reservations(reservationID, reserverID, parkingLotID, state, licensePlate, reservationDate, startTime, endTime, actualArrivalTime, actualDepartureTime)
COPY Reservations FROM stdin USING DELIMITERS '|';
20322|100|1033|NY|FAW3376|2022-01-06|16:00:00|20:00:00|17:33:30|19:58:44
21322|101|1033|NY|MMM1233|2022-01-06|16:00:00|20:00:00|16:33:30|19:58:44
29322|100|1033|FL|FAW3376|2022-01-08|16:00:00|20:00:00|16:03:30|19:20:44
21422|104|1033|NJ|EAW7776|2022-01-06|16:00:00|20:00:00|16:00:30|19:39:44
88931|103|2077|CA|DAW3996|2022-01-05|06:00:00|14:00:00|12:14:22|13:20:22
88932|831|777|ON|CSE0180|2022-01-05|00:00:00|14:00:00|09:14:22|13:50:22
20312|100|1033|NY|FAW3376|2021-07-28|18:00:00|19:00:00|17:33:30|19:58:44
21392|101|1033|NY|MMM1233|2021-07-28|16:00:00|19:00:00|16:33:30|19:58:44
29222|20|1033|NJ|EAW9976|2021-07-28|16:05:00|19:00:00|16:03:30|19:20:44
19222|20|777|NJ|EAW9976|2021-07-23|16:05:00|19:00:00|16:07:30|18:20:44
21922|104|1033|NJ|EAW7776|2021-07-28|17:00:00|20:00:00|16:00:30|19:39:44
88131|103|2077|CA|DAW3996|2021-07-28|13:00:00|13:20:00|12:14:22|13:20:22
88132|831|2077|ON|CSE0180|2021-07-28|13:00:00|14:00:00|09:14:22|13:50:22
\.


/* changed customer 104 (Greg Hirsch) to have a NULL isValid instead of False */
-- PaymentMethods(cardType, cardNum, custID, expirationDate, isValid)
COPY PaymentMethods FROM stdin USING DELIMITERS '|';
V|4485876|101|2024-10-30|TRUE
V|4916935|20|2022-11-30|\N
V|4539817|101|2026-01-31|\N
V|4024007|103|2024-04-30|TRUE
M|5380746|90|2022-09-30|TRUE
M|5525750|100|2022-10-30|TRUE
M|5198415|101|2025-10-30|\N
A|6011024|104|2021-05-30|\N
A|6011209|101|2029-10-30|TRUE
A|6011210|831|2029-10-30|\N
\.

-- Payments(paymentID, reservationID, cardType, cardNum, paymentDate, amountPaid)
COPY Payments FROM stdin USING DELIMITERS '|';
102221|20322|M|5525750|2022-01-05|41.00
102222|21322|M|5198415|2022-01-05|41.00
102223|29322|M|5525750|2022-01-05|41.00
198331|88931|A|6011024|2022-01-05|1592.8
102231|88132|A|6011210|2022-01-05|41.00
102232|21922|A|6011024|2022-01-05|43.00
102233|29222|V|4916935|2022-01-05|41.00
198341|88131|V|4024007|2022-01-05|1592.8
\.
