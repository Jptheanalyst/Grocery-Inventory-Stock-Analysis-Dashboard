SELECT 
    *
FROM
    inventory.grocery_inventory;

-- Data Cleaning --

SELECT 
    Date_Received,
    STR_TO_DATE(Date_Received, '%m/%d/%Y') AS date_received_cleaned
FROM
    inventory.grocery_inventory;

ALTER TABLE grocery_inventory
ADD COLUMN New_Date_Received DATE;

SET SQL_SAFE_UPDATES = 0;

UPDATE grocery_inventory 
SET 
    New_Date_Received = STR_TO_DATE(Date_Received, '%m/%d/%Y');

SELECT 
    New_Date_Received
FROM
    grocery_inventory;

-- Remove old text column

ALTER TABLE grocery_inventory DROP COLUMN Date_Received;

ALTER TABLE grocery_inventory
RENAME COLUMN New_Date_Received TO Date_Received;

-- Last Order Date

SELECT 
    Last_Order_Date,
    STR_TO_DATE(Last_Order_Date, '%m/%d/%Y') AS Last_Order_Date_cleaned
FROM
    inventory.grocery_inventory;

ALTER TABLE grocery_inventory
ADD COLUMN New_Last_Order_Date DATE;

UPDATE grocery_inventory 
SET 
    New_Last_Order_Date = STR_TO_DATE(Last_Order_Date, '%m/%d/%Y');

ALTER TABLE grocery_inventory DROP COLUMN Last_Order_Date;

ALTER TABLE grocery_inventory
RENAME COLUMN New_Last_Order_Date TO Last_Order_Date;

-- Expiration date

SELECT 
    Expiration_Date,
    STR_TO_DATE(Expiration_Date, '%m/%d/%Y') AS Expiration_Date_cleaned
FROM
    inventory.grocery_inventory;

ALTER TABLE grocery_inventory
ADD COLUMN New_Expiration_Date DATE;

UPDATE grocery_inventory 
SET 
    New_Expiration_Date = STR_TO_DATE(Expiration_Date, '%m/%d/%Y');

ALTER TABLE grocery_inventory DROP COLUMN Expiration_Date;

ALTER TABLE grocery_inventory
RENAME COLUMN New_Expiration_Date TO Expiration_Date;

-- Clean Currency from text to values and remove $ sign 

SELECT 
    Unit_Price, REPLACE(Unit_price, '$', '') AS Clean_unit_price
FROM
    grocery_inventory
LIMIT 5;

ALTER TABLE grocery_inventory
ADD COLUMN New_Unit_price DECIMAL (10,2);

UPDATE grocery_inventory 
SET 
    New_Unit_price = REPLACE(Unit_price, '$', '');

ALTER TABLE grocery_inventory DROP COLUMN Unit_Price;

ALTER TABLE grocery_inventory 
RENAME COLUMN New_Unit_Price TO Unit_Price;

ALTER TABLE grocery_inventory 
RENAME COLUMN Catagory TO Category;
