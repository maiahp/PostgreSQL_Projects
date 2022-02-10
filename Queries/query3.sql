/*
Find city and state of Parking Lots which have no reservations.
In the result, attributes should appear as theCity and theState
No duplicates should appear
*/

SELECT DISTINCT p.city AS theCity, p.state AS theState
FROM ParkingLots p
WHERE p.parkingLotID NOT IN (SELECT parkingLotID 
                             FROM Reservations)

/* NOTE:
We are looking at city, state data in ParkingLots table
Since there can be multiple parking lots in one city, 
If two parking lots in one city and state and both have no reservations,
then the city,state will show up twice, so we will have duplicates.

for p in ParkingLots:
    if city,state not found in the city,state of a reserved parking lot:
       return city,state

The inner select statement needs no where clause:
We are selecting all parkingLotIDs from the Reservations table
*/ 
