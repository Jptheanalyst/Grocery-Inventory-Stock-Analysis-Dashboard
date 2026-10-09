-- Create View


CREATE VIEW view_stock_alerts AS
    SELECT 
        Product_ID,
        Product_Name,
        Category,
        Stock_Quantity,
        Reorder_Level,
        Reorder_Quantity,
        Unit_Price,
        (Stock_Quantity * Unit_Price) AS Inventory_Value,
        CASE
            WHEN Stock_Quantity <= 0 THEN 'Out of Stock'
            WHEN Stock_Quantity <= Reorder_Level THEN 'Reorder Required'
            ELSE 'Healthy Stock'
        END AS Stock_Status,
        (Reorder_Quantity * Unit_Price) AS Restock_Cost_Required
    FROM
        grocery_inventory;

SELECT 
    *
FROM
    view_stock_alerts;


