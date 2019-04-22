--queryview.sql

--exchangeName, stockName, numHighClosings
SELECT e.exchangeName, s.stockName, q.counted as numHighClosings
FROM Exchanges e, Stocks s, 
(   
    SELECT exchangeID, symbol, count(*) as counted
    FROM QuotesSummary
    WHERE openingPrice <= closingPrice
    GROUP BY exchangeID, symbol
) as q 
WHERE q.exchangeID = e.exchangeID AND e.exchangeID = s.exchangeID AND q.symbol = s.symbol AND q.counted >= 2
GROUP BY e.exchangeName, s.stockName, q.counted;

-- RESULTS:       
--exchangename            |   stockname   |  numHighClosings 
--------------------------+---------------+---------
--New York Stock Exchange | Cloudera,Inc. |       3
--New York Stock Exchange | HP Enterprise |       2


DELETE FROM Quotes WHERE exchangeID = 'NYSE' AND symbol = 'CLDR' OR exchangeID = 'NASDAQ' AND symbol = 'ANF';

-- RESULTS AFTER DELECTION:
--exchangename            |   stockname   |  numHighClosings 
--------------------------+---------------+---------
--New York Stock Exchange | HP Enterprise |       2
