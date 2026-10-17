USE SalaseIndustries;
SELECT ProductID, SUM(QuantitySold) AS TotalUnitsSold
FROM Sales
GROUP BY ProductID
ORDER BY TotalUnitsSold DESC
LIMIT 1;
