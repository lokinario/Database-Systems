-- Author : Robert Loquinario
-- Email : rloquina@ucsc.edu

-- Initialize Schema

CREATE SCHEMA Lab1;

ALTER ROLE rloquina SET SEARCH_PATH to Lab1;


-- Create the tables/relations

CREATE TABLE Exchanges(
    exchangeID CHAR(6) PRIMARY KEY,
    exchangeName VARCHAR(30),
    address VARCHAR(30)
);

CREATE TABLE Stocks(
    exchangeID CHAR(6),
    symbol CHAR(4),
    stockName VARCHAR(30),
    address VARCHAR(30),
    PRIMARY KEY (exchangeID, symbol)
);

CREATE TABLE Customers(
    customerID integer PRIMARY KEY,
    custName VARCHAR(30),
    address VARCHAR(30),
    category CHAR(1),
    isValidCustomer boolean
);

CREATE TABLE Trades(
    exchangeID CHAR(6),
    symbol CHAR(4),
    tradeTS timestamp,
    buyerID integer,
    sellerID integer,
    price decimal(7,2),
    volume integer,
    PRIMARY KEY(exchangeID,symbol,tradeTS)
);

CREATE TABLE Quotes(
    exchangeID CHAR(6),
    symbol CHAR(4),
    quoteTS timestamp,
    price decimal(7,2),
    PRIMARY KEY(exchangeID,symbol,quoteTS)
);
