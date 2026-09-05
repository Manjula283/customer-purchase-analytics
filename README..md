# Customer Shopping Behavior Analysis

## 📌 Project Overview

This is an end-to-end Data Analytics project focused on analyzing
customer shopping behavior and identifying patterns in purchasing,
product preferences, customer demographics, discounts, subscriptions,
and revenue.

The project demonstrates a complete analytics workflow using **Python,
Pandas, SQLAlchemy, MySQL, SQL, and Power BI**.

## 🎯 Business Objective

The objective of this project is to analyze customer shopping data and
answer key business questions such as:

-   Which customer segments generate the most revenue?
-   Which product categories and items perform best?
-   How does customer spending vary by gender and age group?
-   Which seasons generate the highest revenue?
-   Does subscription status influence customer spending?
-   What is the impact of discounts and promo codes?
-   Which locations contribute the most revenue?
-   Which shipping methods are most commonly used?
-   What products and customer segments should the business focus on?

## 🛠️ Tools & Technologies

-   **Python** -- Data loading, cleaning, exploratory data analysis
-   **Pandas & NumPy** -- Data manipulation and analysis
-   **Matplotlib / Seaborn** -- Exploratory visualizations
-   **SQLAlchemy** -- Transfer of the cleaned Pandas DataFrame to MySQL
-   **MySQL / MySQL Workbench** -- Database storage and SQL business
    analysis
-   **SQL** -- Aggregation, filtering, grouping, subqueries, CASE
    statements, and business analysis
-   **Power BI** -- Interactive dashboard and visualization
-   **GitHub** -- Project documentation and version control

## 🔄 End-to-End Workflow

``` text
Customer Shopping CSV
        ↓
Python / Pandas
        ↓
Data Cleaning & EDA
        ↓
SQLAlchemy
        ↓
MySQL Database
        ↓
SQL Business Analysis
        ↓
Power BI
        ↓
Interactive Dashboard
        ↓
Business Insights & Recommendations
```

## 📂 Project Structure

``` text
Customer-Shopping-Behavior/
│
├── customer_shopping_behavior.csv
├── Customer_Shopping_Behavior_Analysis.ipynb
├── Customer_Shopping_Behavior_SQL_Analysis.sql
├── Customer_Shopping_Behavior.pbix
└── README.md
```

## 🐍 1. Python -- Data Preparation & EDA

The CSV dataset is initially loaded into Pandas.

Main activities include:

-   Loading the dataset
-   Inspecting rows and columns
-   Checking data types
-   Checking missing values
-   Checking duplicate records
-   Generating descriptive statistics
-   Understanding customer demographics
-   Analyzing product and category performance
-   Exploring purchase amounts
-   Examining subscription and discount behavior
-   Creating exploratory visualizations

Example:

``` python
import pandas as pd

df = pd.read_csv("customer_shopping_behavior.csv")

df.head()
df.info()
df.describe()
df.isnull().sum()
df.duplicated().sum()
```

## 🧹 2. Data Cleaning

The dataset is reviewed and prepared for analysis by:

-   Handling missing values where required
-   Checking and removing duplicate records where appropriate
-   Validating numerical columns
-   Checking categorical values
-   Ensuring the dataset is suitable for database analysis

The cleaned DataFrame is then used for the database-loading stage.

## 🗄️ 3. SQLAlchemy -- Python to MySQL

SQLAlchemy is used to establish a connection between Python and MySQL.

The cleaned Pandas DataFrame is transferred into the MySQL database
using `to_sql()`.

``` text
Pandas DataFrame
       ↓
   SQLAlchemy
       ↓
MySQL: customer_behavior
       ↓
Table: customer
```

The MySQL database contains the `customer` table used for subsequent SQL
analysis.

> **Note:** The database password should never be committed to GitHub.
> Credentials should be stored securely and removed from publicly shared
> notebooks/scripts.

## 🐬 4. MySQL -- SQL Business Analysis

The `customer` table is analyzed directly in MySQL.

Key analyses include:

### Revenue Analysis

-   Total revenue by gender
-   Total revenue by category
-   Revenue by season
-   Revenue by location
-   Revenue by gender and category

### Product Analysis

-   Most popular items
-   Top 5 items by revenue
-   Average purchase amount by category
-   Highest average purchase category

### Customer Analysis

-   Customer count
-   Age-group analysis
-   Top customers by purchase amount
-   Gender-based purchasing behavior

### Marketing Analysis

-   Discount vs non-discount customer behavior
-   Promo code usage
-   Customers using discounts who spend above the overall average

### Subscription Analysis

-   Subscription vs non-subscription customers
-   Average purchase amount by subscription status
-   Revenue by subscription status

### Operations Analysis

-   Shipping type usage
-   Average purchase amount by shipping type

## 📊 5. Power BI Dashboard

Power BI is connected to the MySQL database to create an interactive
dashboard.

### Key KPI Cards

-   Total Revenue
-   Total Orders
-   Total Customers
-   Average Purchase Amount
-   Average Review Rating

### Dashboard Visuals

The dashboard can include:

-   Revenue by Category
-   Revenue by Gender
-   Revenue by Season
-   Top Items by Revenue
-   Revenue by Location
-   Subscription Status Analysis
-   Discount Analysis
-   Shipping Type Analysis
-   Age Group Analysis

### Interactive Filters

Useful slicers include:

-   Gender
-   Category
-   Season
-   Location
-   Subscription Status
-   Discount Applied

## 📈 Key Business Insights

The final insights are derived from the actual SQL and Power BI results
rather than assumptions.

Examples of areas evaluated:

-   Highest-revenue product categories
-   Highest-performing products
-   Customer segments with higher spending
-   Seasonal revenue patterns
-   Subscription customer behavior
-   Discount and promotional activity
-   High-performing locations
-   Customer purchasing patterns

## 💡 Business Recommendations

Based on the analysis, recommendations can focus on:

-   Prioritizing high-performing product categories
-   Promoting high-revenue products
-   Targeting valuable customer segments
-   Evaluating the effectiveness of discounts and promo codes
-   Strengthening subscription programs if subscribers demonstrate
    stronger purchasing behavior
-   Focusing marketing efforts on high-performing locations and customer
    segments

Recommendations should be updated after reviewing the final dashboard
results.

## 📁 Deliverables

  Deliverable       Description
  ----------------- --------------------------------
  Python Notebook   Data loading, cleaning and EDA
  SQL Script        MySQL business analysis
  Power BI Report   Interactive dashboard
  README            Project documentation

## 🚀 Project Outcome

This project demonstrates an end-to-end Data Analyst workflow, starting
from raw customer shopping data and progressing through data
preparation, exploratory analysis, database integration, SQL analysis,
visualization, and business insights.

It showcases practical skills in **Python, Pandas, SQLAlchemy, MySQL,
SQL, Power BI, data visualization, and business analysis**.
