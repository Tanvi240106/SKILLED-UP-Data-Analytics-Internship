USE SalaseIndustries;
SELECT p.Category, SUM(s.TotalAmount) AS TotalRevenue
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
GROUP BY p.Category
HAVING TotalRevenue > 200000;

