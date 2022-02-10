/* 
Task:
Find name, level, joinDate for each customer whose name has the letter 'e' as second letter
and who owns at least one red vehicle (where color is 'R')
No duplicates
Should appear in reverse alphabetical order based on name (DESC)
Two result tuples that have the same name should appear in increasing order of joinDate (ASC)
*/


SELECT DISTINCT c.name, c.level, c.joinDate
FROM Customers c, Vehicles v
WHERE c.name LIKE '_e%' 
      AND v.color = 'R' 
      AND c.custID = v.ownerID           -- join c and v: the owner must also be the customer
ORDER BY c.name DESC, c.joinDate;          




/* Another way I tried using JOIN ON for practice:
SELECT DISTINCT c.name, c.level, c.joinDate
FROM Customers c JOIN Vehicles v ON c.custID = v.ownerID
WHERE c.name LIKE '_e%'
      AND v.color = 'R'
ORDER BY c.name DESC, c.joinDate;
*/

/* Note: 
Can there be duplicates?
I think there can be duplicates. This is because the same owner can own multiple red cars.
Think of inner for loop:
for each customer:
    for each vehicle:
        if vehicle is red and customer has name where 2nd letter 'e':
            // a customer can have multiple red vehicles, which would return the same customer more than once
*/

