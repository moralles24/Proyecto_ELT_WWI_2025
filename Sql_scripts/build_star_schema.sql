USE WideWorldImporters

--DIM LOCATION
SELECT 
    R.CityID, 
    R.CityName, 
    R.LatestRecordedPopulation AS CityPopulation,
    P.StateProvinceID, 
    P.StateProvinceName, 
    P.StateProvinceCode, 
    P.LatestRecordedPopulation AS StatePopulation,
    Ñ.CountryID, 
    Ñ.CountryName, 
    Ñ.Continent, 
    Ñ.LatestRecordedPopulation AS CountryPopulation
FROM Application.Cities R 
INNER JOIN Application.StateProvinces P
    ON R.StateProvinceID = P.StateProvinceID
INNER JOIN Application.Countries Ñ
    ON P.CountryID = Ñ.CountryID;

--DIM PRODUCT

SELECT O.StockItemID, O.StockItemName, V.ColorName, V.ColorID, Y.StockGroupID, Y.StockGroupName,
G.QuantityOnHand, G.LastStocktakeQuantity, G.BinLocation, G.LastEditedWhen FROM Warehouse.StockItems O
INNER JOIN Warehouse.Colors V
ON O.ColorID = V.ColorID 
INNER JOIN Warehouse.StockItemStockGroups L
ON O.StockItemID = L.StockItemID
INNER JOIN Warehouse.StockGroups Y
ON L.StockGroupID = Y.StockGroupID
INNER JOIN Warehouse.StockItemHoldings G
ON O.StockItemID = G.StockItemID

--DIM PEOPLE

SELECT * FROM Application.People

--DIM SUPPLIERS

SELECT I.SupplierID, I.SupplierName, X.SupplierCategoryID, X.SupplierCategoryName, I.PrimaryContactPersonID, B.FullName,
B.EmailAddress, B.PhoneNumber,D.StockItemID, D.StockItemName, C.DeliveryMethodID, C.DeliveryMethodName 
FROM Purchasing.Suppliers I 
INNER JOIN Purchasing.SupplierCategories X
ON I.SupplierCategoryID = X.SupplierCategoryID
INNER JOIN Application.People B
ON I.PrimaryContactPersonID = B.PersonID
INNER JOIN Warehouse.StockItems D
ON I.SupplierID = D.SupplierID
INNER JOIN Application.DeliveryMethods C
ON I.DeliveryMethodID = C.DeliveryMethodID 

--DIM CUSTOMERS

SELECT K.CustomerID, K.CustomerName, K.CustomerCategoryID, J.CustomerCategoryName, K.BuyingGroupID, Y.BuyingGroupName,
K.PhoneNumber, K.FaxNumber FROM Sales.Customers K
INNER JOIN Sales.CustomerCategories J
ON K.CustomerCategoryID = J.CustomerCategoryID
INNER JOIN Sales.BuyingGroups Y
ON K.BuyingGroupID = Y.BuyingGroupID

--DIM SALES

SELECT R.OrderID, R.OrderDate, V.CustomerID, V.CustomerName, C.StockItemID, C.StockItemName,
C.Brand, C.Size, N.ColorID, N.ColorName FROM Sales.Orders R
INNER JOIN sales.OrderLines Q
ON R.OrderID = Q.OrderID
INNER JOIN sales.Customers V
ON R.CustomerID = V.CustomerID
INNER JOIN Warehouse.StockItems C
ON Q.StockItemID = C.StockItemID
INNER JOIN Warehouse.Colors N
ON C.ColorID = N.ColorID

--FACT TABLE

SELECT Z.OrderID, X.InvoiceID, Z.OrderDate, X.InvoiceDate, B.CustomerID, B.CustomerName, K.StockItemID,
G.StockItemName, K.Description, K.PackageTypeID, I.PackageTypeName,X.DeliveryMethodID,U.DeliveryMethodName, 
K.Quantity, K.UnitPrice, (K.Quantity * K.UnitPrice) AS Total, K.TaxRate, K.TaxAmount, ((K.Quantity*K.UnitPrice)+K.TaxAmount)
AS Total_with_Tax, K.LineProfit FROM Sales.Orders Z
INNER JOIN Sales.Invoices X
ON Z.OrderID = X.OrderID
INNER JOIN Sales.Customers B
ON Z.CustomerID = B.CustomerID
INNER JOIN Sales.InvoiceLines K
ON X.InvoiceID = K.InvoiceID
INNER JOIN Warehouse.StockItems G
ON K.StockItemID = G.StockItemID
INNER JOIN Warehouse.PackageTypes I
ON K.PackageTypeID = I.PackageTypeID
INNER JOIN Application.DeliveryMethods U
ON X.DeliveryMethodID = U.DeliveryMethodID