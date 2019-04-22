-- return exchangeID, stockName, buyerName, sellerName of trades before 2018-01-01 12:00:00. No duplicates.

SELECT DISTINCT t.exchangeID, s.stockName, c1.custName as buyerName, c2.custName as sellerName
FROM Stocks s, Customers c1, Customers c2, Trades t
WHERE t.tradeTS < '2018-01-01 12:00:00'
AND t.symbol = s.symbol
AND c1.customerID = t.buyerID
AND c2.customerID = t.sellerID;