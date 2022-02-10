/*
Some customers may have made reservations in a parking lot that's in New York, NY.
For each customer who has made exactly one reservation in a New York, NY parking lot,
provide the ID of the customer and the stree addr of that parking lot.
No duplicates should appear
*/

/* do not use group by 
   Instead, write a query such that:
   - customer made the reservation for a New York, NY parking lot.
   - there is no other reservation made by that customer for a New York, NY parking lot, not even for the same parking lot.
*/


-- First conditions inside the where clause:
   -- customer made reservation in New York, NY parking lot
-- The conditions inside the 'NOT EXISTS'
   -- finds customers who made another reservation in a New York, NY parking lot

SELECT c.custID, p.streetAddr
FROM Reservations r1, ParkingLots p, Customers c
WHERE  r1.parkingLotID = p.parkingLotID              -- join r1 and p: must be talking about same parking lot
       AND p.city = 'New York' AND p.state = 'NY'    -- parking lot must be in New York, NY
       AND r1.reserverID = c.custID                  -- join r1 and c: must be talking about same customer 
       AND NOT EXISTS                                         -- and the following returns no result tuples
          (SELECT * FROM Reservations r2, ParkingLots p1      -- select all
           WHERE r1.reservationID != r2.reservationID         -- where reservations are different
              AND r1.reserverID = r2.reserverID            -- the customer is the same one
              AND p1.city = 'New York' AND p1.state = 'NY' -- parking lot in New York, NY
              AND r2.parkingLotID = p1.parkingLotID);      -- join r2 and p2: must be talking about same parking lot
          
/*
Will the result have duplicates?
StreetAddr's are not unique. There can be same street addresses in different cities
the custID, streetAddr would not be a unique combo if we were looking at customers who 
did not make multiple reservations in the same city. (They could make reservations at the same
street address in two different cities.)
But we are only looking at streets in New York.
If a customer made more than 1 reservation (having diff reservationID) in a parking lot in New York, 
they would not be part of the results. Our results don't include streetAddr of parking lots from other cities.
So the (custID, streetAddr) combination is unique.
*/

