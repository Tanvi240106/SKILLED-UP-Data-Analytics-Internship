USE SalaseIndustries;
SELECT CustomerID, COUNT(SaleID) AS PurchaseCount
FROM Sales
GROUP BY CustomerID
ORDER BY PurchaseCount DESC
LIMIT 3;
