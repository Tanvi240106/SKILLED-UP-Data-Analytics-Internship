USE SalaseIndustries;
SELECT ProductID, AVG(TotalAmount) AS AvgAmountPerSale
FROM Sales
GROUP BY ProductID;

