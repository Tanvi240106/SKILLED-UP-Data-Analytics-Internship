USE SalaseIndustries;
SELECT sa.AgentID, SUM(s.TotalAmount) AS TotalSales
FROM Sales s
JOIN Agent_Sales sa ON s.SaleID = sa.SaleID
GROUP BY sa.AgentID
HAVING TotalSales > 100000;
