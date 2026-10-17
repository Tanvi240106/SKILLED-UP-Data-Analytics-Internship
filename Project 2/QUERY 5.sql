USE SalaseIndustries;
SELECT CustomerID, SUM(TotalAmount) AS TotalSpent
FROM Sales
GROUP BY CustomerID;
