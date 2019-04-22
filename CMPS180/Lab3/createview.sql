-- starting view
CREATE VIEW templateView AS
    SELECT distinct q.exchangeID, q.symbol, DATE(q.quoteTS) as theDate,
    MIN(q.quoteTS) as openTime, MAX(q.quoteTS) as closeTime,
    MIN(q.price) as lowPrice, MAX(q.price) as highPrice
    FROM Quotes q
    GROUP BY q.exchangeID, q.symbol, DATE(q.quoteTS)
    ORDER BY DATE(q.quoteTS) ASC;

CREATE VIEW quotesSummary AS 
    SELECT distinct qs.exchangeID, qs.symbol, qs.theDate, q.price as openingPrice, q1.price as closingPrice, qs.lowPrice, qs.highPrice
    FROM Quotes q, Quotes q1, templateView qs 
    WHERE q.quoteTS = qs.openTime AND q1.quoteTS = qs.closeTime
    ORDER BY theDate ASC;

