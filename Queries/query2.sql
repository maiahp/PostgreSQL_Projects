/* 
Find all reservations on July 28, 2021 whose actual arrival time is before its start time
and whose actual departure time is after its end time. 
For such a reservation, there should be a result tuple that provides the ID and name of the customer
who made the reservation, as well as the ID and street address of the reservation's parking lot,
no duplicates should appear in result 
*/




SELECT c.custID, c.name, r.parkingLotID, p.streetAddr 
FROM Customers c, ParkingLots p, Reservations r
WHERE r.reservationDate = '2021-07-28' 
      AND r.actualArrivalTime < r.startTime 
      AND r.actualDepartureTime > r.endTime
      AND c.custID = r.reserverID
      AND r.parkingLotID = p.parkingLotID; 

/* Note:
Can there be duplicates?
There is a constraint that (r.reserverID, r.reservationDate) is unique in Reservations
No customer can make more than one reservation on the same day
Returning the values (custID, name, parkingLotID, streetAddr) alone would not be unique
because a customer can make a reservation for the same parking lot for different days,
but because no customer can make more than one reservation on the same date and we are only looking
at reservations for the same date, there can not be duplicates.

for c in Customers:
   for p in ParkingLots:
       for r in Reservations:
           Find all reservations on a specific day
*/
