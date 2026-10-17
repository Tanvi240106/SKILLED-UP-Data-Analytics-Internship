USE SalaseIndustries;
SELECT p.Category, SUM(s.TotalAmount) AS Revenue
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
GROUP BY p.Category;
