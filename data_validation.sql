-- Check NULL VALUES

SELECT 
    COUNT(CASE
        WHEN Product_ID IS NULL OR Product_ID = '' THEN 1
    END) AS Missing_IDs,
    COUNT(CASE
        WHEN
            Product_Name IS NULL
                OR Product_Name = ''
        THEN
            1
    END) AS Missing_Names,
    COUNT(CASE
        WHEN Category IS NULL OR Category = '' THEN 1
    END) AS Missing_Categories,
    COUNT(CASE
        WHEN
            Warehouse_Location IS NULL
                OR Warehouse_Location = ''
        THEN
            1
    END) AS Missing_Warehouses,
    COUNT(CASE
        WHEN
            Supplier_Name IS NULL
                OR Supplier_Name = ''
        THEN
            1
    END) AS Missing_Suppliers
FROM
    grocery_inventory;

SELECT 
    Product_Name, Category
FROM
    grocery_inventory
WHERE
    Category IS NULL OR Category = '';

-- 1 Category blank

UPDATE grocery_inventory 
SET 
    Category = 'Fruits & Vegetables'
WHERE
    Product_Name LIKE '%Cabbage%'
        AND (Category IS NULL OR Category = '');

-- Fallback Checking
UPDATE grocery_inventory 
SET 
    Category = 'General Grocery'
WHERE
    Category IS NULL OR Category = ''
        OR Category = 'null';

UPDATE grocery_inventory 
SET 
    Warehouse_Location = 'Unassigned Warehouse'
WHERE
    Warehouse_Location IS NULL
        OR Warehouse_Location = '';

UPDATE grocery_inventory 
SET 
    Supplier_Name = 'Independent Local Vendor'
WHERE
    Supplier_Name IS NULL
        OR Supplier_Name = '';
