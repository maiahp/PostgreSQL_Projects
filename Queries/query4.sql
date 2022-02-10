/* Find paymentID and custID for all payments that:
   the payment amount is 123.99 or less
   payment method used has an isValid value that is NULL
   payment was made by customer who is not allowed to make reservations (canReserve = False for customer)
   payment was made for a reservation in a parking lot whose location is in New York, NY (city is 'New York' and state is 'NY' for that parking lot 
   
   No duplicates should appear in result
*/

SELECT p.paymentID, c.custID
FROM Payments p, PaymentMethods pm, Customers c
WHERE p.amountPaid <= 123.99                    -- payment <= 123.99 
      AND pm.isValid IS NULL                    -- card isValid is null
      AND p.cardType = pm.cardType              -- join p and pm, entries must correspond to same payment
      AND p.cardNum = pm.cardNum                -- "     "
      AND c.canReserve = False                  -- customer not allowed to make reservations
      AND c.custID = pm.custID                  -- join c and pm, payment must refer to same customer
      AND p.reservationID IN                    -- reservationID made in New York, NY parking lot
          (SELECT r.reservationID
           FROM Reservations r, ParkingLots p1
           WHERE p1.city = 'New York' AND p1.state = 'NY'
                 AND r.parkingLotID = p1.parkingLotID);   -- join r and p1: must refer to same parkingLot
      
/*
Can we have duplicates?
Is paymentID, custID unique?
paymentID is unique to each payment made
customerID is unique to each customer, the same customer can make multiple payments
A customer cannot make a payment which has the same paymentID twice
I think the results are unique, no need for distinct
This is because we only iterate through Payments Table once, not twice (looking at each payment id only once and one customer
corresponds to it)

for p in payments:
    for pm in PaymentMethods:
        for c in Customers:
              return paymentID, custID where (conditions)
*/


/* note:
If a table is in the FROM clause
it must be joined with all other tables possible when there is a foreign key between them
if you need this to be the same for the results
*/
