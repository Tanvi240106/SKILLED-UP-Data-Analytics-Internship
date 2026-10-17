USE SalaseIndustries;
SELECT p.ProductName, SUM(s.TotalAmount) AS TotalRevenue
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
GROUP BY s.ProductID, p.ProductName
ORDER BY TotalRevenue DESC
LIMIT 5;
