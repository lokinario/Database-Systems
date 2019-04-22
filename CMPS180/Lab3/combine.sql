BEGIN TRANSACTION;
SET TRANSACTION READ WRITE ISOLATION LEVEL SERIALIZABLE;
INSERT INTO Lab3.Customers(customerID, custName, address, category, isValidCustomer)
(
    SELECT customerID, custName, address, NULL, TRUE
    FROM Lab3.NewCustomers
    WHERE NOT EXISTS (
        SELECT *
        FROM Lab3.Customers
        WHERE customerID = NewCustomers.customerID
        )
);
UPDATE Customers
SET custName = NewCustomers.custName, address = NewCustomers.address, isValidCustomer = TRUE
FROM NewCustomers
WHERE Customers.customerID = NewCustomers.customerID;
COMMIT;