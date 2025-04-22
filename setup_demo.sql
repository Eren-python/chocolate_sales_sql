-- setup_demo.sql
-- Script de creación de tablas y carga de datos para chocolate_sales.db

-- Eliminación previa (opcional para entorno de pruebas)
DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS ProductBrand;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Brands;
DROP TABLE IF EXISTS Branches;
DROP TABLE IF EXISTS Countries;

-- Tabla Countries
CREATE TABLE Countries (
    CountryID INTEGER PRIMARY KEY,
    CountryName TEXT
);

-- Tabla Branches
CREATE TABLE Branches (
    BranchID INTEGER PRIMARY KEY,
    BranchName TEXT,
    CountryID INTEGER,
    FOREIGN KEY (CountryID) REFERENCES Countries(CountryID)
);

-- Tabla Brands
CREATE TABLE Brands (
    BrandID INTEGER PRIMARY KEY,
    Name TEXT,
    Country TEXT
);

-- Tabla Products
CREATE TABLE Products (
    ProductID INTEGER PRIMARY KEY,
    Name TEXT,
    Category TEXT,
    Size TEXT,
    Packaging TEXT
);

-- Tabla puente ProductBrand
CREATE TABLE ProductBrand (
    ProductID INTEGER,
    BrandID INTEGER,
    PRIMARY KEY (ProductID, BrandID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (BrandID) REFERENCES Brands(BrandID)
);

-- Tabla de ventas
CREATE TABLE Sales (
    SaleID INTEGER PRIMARY KEY,
    SaleDate DATE,
    ProductID INTEGER,
    BranchID INTEGER,
    Quantity INTEGER,
    UnitPrice DECIMAL(10,2),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (BranchID) REFERENCES Branches(BranchID)
);

-- Datos de ejemplo
INSERT INTO Countries VALUES (1, 'México'), (2, 'Canadá');

INSERT INTO Branches VALUES 
  (1, 'Sucursal CDMX', 1),
  (2, 'Sucursal Monterrey', 1),
  (3, 'Sucursal Toronto', 2);

INSERT INTO Brands VALUES 
  (1, 'ChocoMax', 'México'),
  (2, 'SweetTreats', 'Canadá');

INSERT INTO Products VALUES 
  (101, 'Barra Oscura 70%', 'Chocolate Oscuro', '100g', 'Envuelto'),
  (102, 'Tableta con Almendras', 'Chocolate con leche', '90g', 'Caja');

INSERT INTO ProductBrand VALUES (101, 1), (102, 2);

INSERT INTO Sales VALUES
  (1, '2025-01-10', 101, 1, 20, 25.00),
  (2, '2025-01-12', 101, 2, 15, 25.00),
  (3, '2025-01-15', 102, 3, 30, 22.50);
