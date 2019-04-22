--Find name and symbol for each stock that is NOT listed in the 'NASDAQ Stock Exchange'. No duplicates.
SELECT DISTINCT s.stockName, s.symbol 
FROM Stocks s, Exchanges e
WHERE s.exchangeID <> (SELECT e1.exchangeID FROM Exchanges e1 WHERE e1.exchangeName = 'NASDAQ Stock Exchange');