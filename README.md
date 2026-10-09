
# Grocery Inventory & Stock Analysis Dashboard

A data analytics project using **MySQL and Tableau** to analyze grocery inventory levels, identify products requiring replenishment, evaluate restocking costs, and support inventory management decisions.

## Dashboard Preview

![Grocery Inventory Dashboard](images/inventory-dashboard.jpeg)



*Interactive dashboard developed in Tableau Public to monitor inventory health, replenishment costs, and products requiring reorder.*

## Project Purpose

The purpose of this project is to transform raw grocery inventory data into actionable insights that help businesses monitor stock levels, identify products approaching or below their reorder thresholds, and understand the financial requirements of replenishing inventory.


Using MySQL for data cleaning and transformation and Tableau for interactive visualization, this project provides an overview of inventory health, restocking requirements, and category-level spending.

The goal is to demonstrate an end-to-end data analytics workflow, from raw data preparation to dashboard development and business recommendations.

## 2. Key Contributions & Achievements

* **Data Cleaning with MySQL:** Converted date fields from text to proper date formats and cleaned currency values by removing dollar signs and converting prices into numeric data types.
* **Data Quality Management:** Investigated missing values, corrected the misspelled `Catagory` column name to `Category`, and handled missing category, warehouse, and supplier information.
* **SQL Business Logic:** Created a stock classification system using `CASE` statements to categorize products as Healthy Stock, Reorder Required, or Out of Stock.
* **SQL View Development:** Created a reusable `view_stock_alerts` view containing inventory attributes, stock status, and calculated restocking costs for downstream analysis.
* **KPI Development:** Created inventory performance metrics, including total SKUs, inventory value, required restock budget, products requiring attention, and stock risk rate.
* **Tableau Dashboard Development:** Built a dashboard combining KPI cards, a stock-level scatter plot, a stock status distribution chart, a department restocking cost chart, and an actionable reorder table.
* **Actionable Analysis:** Organized products requiring replenishment by current stock quantity to help prioritize low-stock items.

## 3. Key Performance Indicators (KPIs) & Core Insights

The dashboard summarizes inventory health and financial exposure using the following metrics.

| KPI                      |      Result | Interpretation                                                              |
| ------------------------ | ----------: | --------------------------------------------------------------------------- |
| Total SKUs               |         990 | Total number of distinct products analyzed                                  |
| Total Inventory Value    | $332,654.71 | Estimated value of current inventory based on stock quantity and unit price |
| Restock Budget Required  | $305,485.04 | Estimated cost of purchasing the specified reorder quantities               |
| Products Requiring Order |         465 | Products classified as Reorder Required                                     |
| Stock Risk Rate          |      46.97% | Percentage of analyzed products requiring attention                         |

### Core Insights

**1. A substantial proportion of products require replenishment.**

Of the 990 products analyzed, 465 are classified as Reorder Required, representing 46.97% of the inventory assortment. This indicates that a considerable portion of products are at or below their reorder thresholds.

**2. Restocking represents a significant budget requirement.**

The estimated restock budget is $305,485.04. This figure represents the calculated cost of the specified reorder quantities, rather than the current inventory's total value.

**3. Fruits & Vegetables has the highest required restocking cost.**

The department comparison identifies Fruits & Vegetables as the largest contributor to required restocking expenditure, followed by Seafood and Beverages. These categories warrant closer examination when allocating replenishment budgets.

**4. Inventory levels vary considerably across products.**

The scatter plot compares Stock Quantity against Reorder Level, helping distinguish products with relatively healthy stock levels from those requiring replenishment.

**5. Product-level analysis supports operational decisions.**

The actionable reorder list identifies individual products with low stock quantities, their reorder thresholds, and their estimated restocking costs. This helps translate dashboard findings into specific replenishment priorities.

## 4. Recommendations

Based on the analysis, the following actions are recommended:

**1. Prioritize products with the lowest stock levels.**

Review the actionable reorder list regularly and prioritize products with the lowest available quantities, particularly those significantly below their reorder levels.

**2. Allocate restocking budgets strategically.**

Use the department-level restocking cost chart to identify categories with the largest estimated replenishment requirements. Review purchasing priorities alongside product demand, sales velocity, and supplier lead times before allocating budgets.

**3. Establish consistent reorder monitoring.**

Use reorder thresholds to identify products that require attention before stock becomes unavailable. Where possible, integrate sales and supplier lead-time data to improve reorder timing.

**4. Investigate high-cost replenishment categories.**

Review the products contributing most to the required restocking cost within Fruits & Vegetables, Seafood, and Beverages. This can help determine whether high expenditure is driven by unit prices, reorder quantities, or the number of products requiring replenishment.

**5. Improve future inventory analysis.**

Extend the project by incorporating historical sales, inventory movement, supplier delivery times, and stockout records. These additions could support demand forecasting, inventory turnover analysis, and more accurate replenishment planning.

**6. Account for the dataset's time period.**

Treat the results as a snapshot of the supplied inventory dataset rather than a representation of current operational inventory. Future expiration analysis should use an appropriate historical reference date or a current, regularly updated dataset.

## 5. Data Cleaning & Transformation Process

Data preparation was performed in MySQL before connecting the transformed data to Tableau.

### Step 1: Data type standardization

* Converted `Date_Received`, `Last_Order_Date`, and `Expiration_Date` from text into proper `DATE` fields using `STR_TO_DATE()`.
* Removed dollar signs from `Unit_Price` and converted the values into a numeric `DECIMAL` format.
* Standardized the category column name from `Catagory` to `Category`.

### Step 2: Missing-value handling

* Checked for missing or blank product IDs, product names, categories, warehouse locations, and supplier names.
* Assigned `Fruits & Vegetables` to the identified cabbage record with a missing category.
* Used `General Grocery` as a fallback category for remaining blank or null-like category values.
* Replaced missing warehouse and supplier names with `Unassigned Warehouse` and `Independent Local Vendor`, respectively.

These substitutions preserve the records while making missing information visible for subsequent review.

### Step 3: Inventory business logic

Created calculated fields in the SQL view:

* **Stock Status:** Classifies products as Out of Stock, Reorder Required, or Healthy Stock.
* **Inventory Value:** Calculated as `Stock_Quantity × Unit_Price`.
* **Restock Cost Required:** Calculated as `Reorder_Quantity × Unit_Price`.

The stock classification follows these rules:

* `Stock_Quantity <= 0` → Out of Stock
* `Stock_Quantity <= Reorder_Level` → Reorder Required
* Otherwise → Healthy Stock

### Step 4: Data validation

Grouped records by stock status and counted the products in each category to validate the inventory classification.

The final distribution was:

* Healthy Stock: 525 products
* Reorder Required: 465 products
* Out of Stock: 0 products

The category counts total 990 products, consistent with the dashboard's total SKU count.

### Step 5: Tableau integration

Connected Tableau to the prepared SQL view and used the transformed data to create KPI calculations, charts, and the actionable reorder list.

Expiration analysis was not included in the dashboard because the dataset represents a historical period. Comparing its expiration dates directly against the present day could produce misleading conclusions.

## 6. Tools & Technologies

* **MySQL:** Data cleaning, data type conversion, missing-value handling, SQL calculations, conditional logic, and view creation.
* **Tableau Public:** KPI visualization, inventory analysis, interactive charts, and dashboard development.
* **SQL:** Data validation, aggregation, transformation, and business-rule implementation.

## 7. Dashboard Components

The Tableau dashboard includes:

1. **KPI Summary:** Total SKUs, Total Inventory Value, Restock Budget Required, Products Requiring Order, and Stock Risk Rate.
2. **Stock Level vs. Reorder Thresholds:** Compares current stock quantities against reorder levels.
3. **Stock Status Distribution:** Displays the number of products in each available stock status.
4. **Departments by Required Restock Cost:** Compares the estimated replenishment cost across grocery categories.
5. **Actionable Reorder List:** Lists products requiring replenishment, sorted by current stock quantity.

## 8. Data Source

Original dataset: [Grocery Inventory Dataset — Kaggle](https://www.kaggle.com/datasets/willianoliveiragibin/grocery-inventory)

The dashboard metrics and conclusions are based on the supplied dataset and the transformations documented in this project.

## 9. Project Structure

```text
grocery-inventory-analysis/
├── README.md
├── images/
│   └── inventory-dashboard.png
├── sql/
│   ├── data_cleaning.sql
│   ├── data_validation.sql
│   └── create_stock_alerts_view.sql
└── tableau/
    └── inventory_stock_analysis.twbx
```

## 10. Conclusion

This project demonstrates how SQL and Tableau can be combined to transform raw inventory records into meaningful business insights. By preparing the data, implementing stock classification rules, calculating financial metrics, and visualizing replenishment needs, the project provides a foundation for better inventory monitoring and purchasing decisions.

It also demonstrates practical skills in data cleaning, SQL querying, KPI development, dashboard design, and communicating data-driven recommendations.
