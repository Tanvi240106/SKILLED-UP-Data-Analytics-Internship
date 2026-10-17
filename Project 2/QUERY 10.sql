USE SalaseIndustries;
SELECT sa.AgentID, AVG(s.QuantitySold) AS AvgSold
FROM Sales s
JOIN Agent_Sales sa ON s.SaleID = sa.SaleID
GROUP BY sa.AgentID;
