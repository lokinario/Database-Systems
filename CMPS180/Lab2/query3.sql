--return exchangeID and stockName of each stock where there is at least one quote.price < 314.15. No duplicates.
SELECT DISTINCT q.exchangeID, s.stockName 
FROM Stocks s, Quotes q
WHERE q.price < 314.15 
AND q.exchangeID = s.exchangeID
AND q.symbol = s.symbol;