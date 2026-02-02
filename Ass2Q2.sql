SELECT r.RegionName,
    SUM(s.Quantity * s.UnitPrice) AS TotalRevenue
FROM SalesInfo s
JOIN StoreInfo st ON s.StoreID = st.StoreID
JOIN RegionInfo r ON st.RegionID = r.RegionID
GROUP BY r.RegionName;


SELECT 
    st.StoreName,
    SUM(s.Quantity) AS TotalProducts,
    SUM(s.Quantity * s.UnitPrice) AS TotalRevenue
FROM SalesInfo s
JOIN StoreInfo st ON s.StoreID = st.StoreID
GROUP BY st.StoreName;


SELECT 
    s.Product
FROM SalesInfo s
JOIN StoreInfo st ON s.StoreID = st.StoreID
GROUP BY s.Product
HAVING COUNT(DISTINCT st.RegionID) > 1;