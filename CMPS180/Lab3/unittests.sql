
-- violate first foreign key buy inserting a trade with a buyerID that isn't in customers
INSERT INTO Trades(exchangeID, symbol, tradeTS, buyerID, sellerID, price, volume)
    VALUES('NYSE', 'CLDR', CURRENT_TIMESTAMP,0000,1456,123.45,123);


-- violate sellerID that isn't in customers
INSERT INTO Trades(exchangeID, symbol, tradeTS, buyerID, sellerID, price, volume)
    VALUES('NYSE', 'CLDR', CURRENT_TIMESTAMP,1456,0000,123.45,123);

--insert into quotes to violate exchangeID and symbol
INSERT INTO Quotes(exchangeID, symbol, quoteTS, price)
    VALUES('NASDAQ', 'ROBE', CURRENT_TIMESTAMP,123.45);


--insert into trades to violate exchangeID and symbol
INSERT INTO Trades(exchangeID, symbol, tradeTS, buyerID, sellerID, price, volume)
    VALUES('NASDAQ', 'ROBE', CURRENT_TIMESTAMP,1456,1489,123.45,123);

--UPDATE price > 0
UPDATE Quotes
    SET price = 123.45
    WHERE price < 200;

UPDATE Quotes
    SET price = -123.45
    WHERE price < 130;

--UPDATE positive_cost
UPDATE Trades
    SET price = 123, volume = 123
    WHERE price < 200 and volume <200;

UPDATE Trades
    SET price = -123, volume = 123
    WHERE price < 200 and volume <200;

--UPDATE buyerID <> sellerID
UPDATE Trades
    SET buyerID = 7777, sellerID = 1456
    WHERE sellerID < 2000;

UPDATE Trades
    SET buyerID = sellerID 
    WHERE buyerID = 7777;

--UPDATE Customers to see if category h then isvalid is true
UPDATE Customers
    SET isValidCustomer = true
    WHERE category = 'H';

UPDATE Customers
    SET isValidCustomer = false
    WHERE category = 'H';
