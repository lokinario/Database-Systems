-- cost = price*volume. Find cost > 5000, buyer is valid cust, and buyer category is not null. No duplicates. 
SELECT DISTINCT t.exchangeID, t.symbol, t.buyerID, t.price*t.volume as theCost, c.category
FROM Trades t, Customers c
WHERE t.price*t.volume >= 5000 
AND c.customerID = t.buyerID
AND c.isValidCustomer
AND c.category IS NOT NULL;
