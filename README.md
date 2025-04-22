# 🍫 chocolate_sales_sql

**Análisis de ventas de chocolate con SQL y diseño de base de datos relacional**

Este proyecto diseña una base de datos relacional en SQLite para analizar ventas de productos de chocolate a nivel de marcas, países, sucursales y productos, basada en el dataset de Kaggle: [Chocolate Sales Dataset](https://www.kaggle.com/datasets/atharvasoundankar/chocolate-sales)

---

## 🎯 Objetivo del proyecto

Diseñar e implementar un sistema de base de datos que permita:

- Consultar las ventas totales por país, marca y producto.
- Identificar productos más vendidos y con mayor ingreso.
- Analizar patrones mensuales o por sucursal.
- Aplicar principios de normalización, modelado de datos y SQL relacional.

---

## 📁 Estructura del repositorio


chocolate_sales_sql/
chocolate_sales_sql/ ├── Chocolate Sales.csv # Dataset original de Kaggle ├── setup_demo.sql # Script para creación de tablas y carga de datos ├── queries.sql # Consultas SQL de análisis ├── schema/ │ └── database_schema.yaml # Esquema de la base en formato YAML ├── diagrams/ │ └── erd.png # Diagrama entidad-relación (ERD) └── README.md # Documentación del proyecto

📄 Documentación técnica
database_schema.yaml
Este archivo describe la estructura de la base de datos en formato YAML. Incluye los nombres de las tablas, sus campos, tipos de datos, claves primarias y relaciones (llaves foráneas).

Su propósito es ofrecer una representación clara y estructurada del modelo relacional implementado, útil tanto para desarrolladores como para documentación técnica o automatización (por ejemplo, generación de diagramas ERD o validaciones).

📌 Puedes visualizar este archivo como una "hoja de ruta" que refleja cómo están organizados y relacionados los datos del proyecto.

🧪 Consultas clave en DBeaver
sql
Copiar
Editar
-- Productos más vendidos
SELECT p.Name, SUM(s.Quantity) AS TotalUnits
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
GROUP BY p.Name
ORDER BY TotalUnits DESC;

-- Total de ventas por país
SELECT c.CountryName, SUM(s.Quantity * s.UnitPrice) AS TotalSales
FROM Sales s
JOIN Branches b ON s.BranchID = b.BranchID
JOIN Countries c ON b.CountryID = c.CountryID
GROUP BY c.CountryName;

-- Comparativa productos por marca
SELECT 
  b.Name AS BrandName,
  p.Name AS ProductName,
  SUM(s.Quantity) AS UnitsSold
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
JOIN ProductBrand pb ON p.ProductID = pb.ProductID
JOIN Brands b ON pb.BrandID = b.BrandID
GROUP BY b.Name, p.Name
ORDER BY b.Name, UnitsSold DESC;

📌 Créditos
Autora: Eren Torres
Repositorio académico para la materia de Bases de Datos
Año: 2025
