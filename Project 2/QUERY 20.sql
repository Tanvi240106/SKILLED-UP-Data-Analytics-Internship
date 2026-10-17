USE SalaseIndustries;
SELECT City, COUNT(DISTINCT CustomerID) AS NumCustomers
FROM Customers
GROUP BY City
HAVING NumCustomers > 5;
