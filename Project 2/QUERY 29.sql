USE SalaseIndustries;
SELECT AgentID, COUNT(SaleID) AS SalesHandled
FROM Agent_Sales
GROUP BY AgentID
ORDER BY SalesHandled DESC
LIMIT 5;

