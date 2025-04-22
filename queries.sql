-- ========================
-- Consultas de análisis SQL
-- ========================

-- 1. Total de ventas por país (en pesos mexicanos)
SELECT 
    c.CountryName,
    SUM(s.Quantity * s.UnitPrice) AS TotalSales
FROM Sales s
JOIN Branches b ON s.BranchID = b.BranchID
JOIN Countries c ON b.CountryID = c.CountryID
GROUP BY c.CountryName;

-- 2. Productos más vendidos por unidades
SELECT 
    p.Name AS ProductName,
    SUM(s.Quantity) AS TotalUnits
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
GROUP BY p.Name
ORDER BY TotalUnits DESC;

-- 3. Ingreso total por marca
SELECT 
    b.Name AS BrandName,
    SUM(s.Quantity * s.UnitPrice) AS TotalRevenue
FROM Sales s
JOIN ProductBrand pb ON s.ProductID = pb.ProductID
JOIN Brands b ON pb.BrandID = b.BrandID
GROUP BY b.Name
ORDER BY TotalRevenue DESC;

-- 4. Ventas por sucursal
SELECT 
    br.BranchName,
    SUM(s.Quantity) AS TotalUnits,
    SUM(s.Quantity * s.UnitPrice) AS TotalSales
FROM Sales s
JOIN Branches br ON s.BranchID = br.BranchID
GROUP BY br.BranchName;

-- 5. Ventas por mes
SELECT 
    STRFTIME('%Y-%m', SaleDate) AS Month,
    SUM(s.Quantity * s.UnitPrice) AS MonthlySales
FROM Sales s
GROUP BY Month
ORDER BY Month;

-- 6. Relación productos y marcas (tabla puente)
SELECT 
    p.Name AS ProductName,
    b.Name AS BrandName
FROM ProductBrand pb
JOIN Products p ON pb.ProductID = p.ProductID
JOIN Brands b ON pb.BrandID = b.BrandID
ORDER BY ProductName;
