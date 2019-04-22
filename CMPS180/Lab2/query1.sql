--find customerID, custName and address from each valid customer whose name contains 'FAKE' and no duplicates
SELECT DISTINCT customerID, custName, address 
FROM Customers 
WHERE custName LIKE '%FAKE%'
AND isValidCustomer;