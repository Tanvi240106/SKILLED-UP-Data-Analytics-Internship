USE SalaseIndustries;
SELECT ProductID, SUM(QuantitySold) AS TotalSold
FROM Sales
GROUP BY ProductID
HAVING TotalSold > 100;
