# SQL Sales Analyst — Mini Project 0

## Project Overview
This project performs an end-to-end Exploratory Data Analysis (EDA) on an e-commerce sales dataset using **SQLite**. The goal is to derive actionable business insights across customer spending patterns, regional performance, product performance, and multi-year sales trends using simple, moderate, and complex SQL queries.

* **Dataset Used:** Superstore Sales Dataset (`train.csv`)[Kaggle dataset:https://www.kaggle.com/datasets/rohitsahoo/sales-forecasting]
* **Tools Used:** SQLite (DB Browser for SQLite)

* **Repository Structure:**
  * `README.md` — Project Documentation & Insights
  * `queries.sql` — All 10 SQL Queries (Basic to Advanced)
  * `train.csv` — Raw Dataset File

---

## 10 Core Business Questions & Insights

### 1. Distinct Product Categories (Simple)
* **Question:** What are the major product categories sold by the enterprise?
* **Insight:** The business operates across **3 primary product categories**: *Furniture*, *Office Supplies*, and *Technology*.

### 2. Top 5 Highest-Value Single Transactions (Simple)
* **Question:** Which individual order transactions generated the highest single-item revenue?
* **Insight:** The largest single transaction was made by **Sean Miller** in **Jacksonville** ($22,638.48), followed by Tamara Chand ($17,499.95). High-value sales are heavily driven by key metro cities.

### 3. Order Count by Shipping Mode (Simple)
* **Question:** How do customers prefer their orders to be shipped?
* **Insight:** **Standard Class** is overwhelmingly the preferred shipping method (**2,945 orders**), while *Same Day* shipping has the lowest adoption (261 orders).

### 4. Regional Sales Breakdown (Moderate)
* **Question:** Which geographic regions generate the highest total sales?
* **Insight:** The **West Region** leads overall revenue ($710,219.68), whereas the **South Region** generates the lowest sales ($389,151.46).

### 5. Sales Breakdown by Category and Sub-Category (Moderate)
* **Question:** How does revenue distribute across categories and sub-categories?
* **Insight:** **Phones** ($327,782.45) in *Technology* and **Chairs** ($322,822.73) in *Furniture* are the top revenue drivers. *Fasteners* generated the lowest revenue ($3,001.96).

### 6. High-Value Customers (> $10,000 Total Spent) (Moderate)
* **Question:** Who are the top accounts that spent more than $10,000 in total?
* **Insight:** Exactly **19 customers** cross the $10,000 total spend threshold, led by **Sean Miller** ($25,043.05) and **Tamara Chand** ($19,052.22).

### 7. Yearly Sales Trend Analysis (Moderate)
* **Question:** What is the overall year-over-year revenue trajectory?
* **Insight:** Sales experienced a slight dip in 2016 ($459,436.01) before recovering strongly in 2017 ($600,192.55) and reaching a peak in **2018 ($722,052.02)**.

### 8. Regional Market Share Percentage (Complex)
* **Question:** What is the percentage contribution of each region to total company sales?
* **Insight:** The **West Region** controls the highest market share at **31.40%**, followed closely by the **East Region** at **29.60%**. Together, they account for over 60% of total company revenue.

### 9. Top 3 Selling Products per Region (Complex)
* **Question:** What are the top 3 best-selling products in each region using Window Functions?
* **Insight:** The **Canon imageCLASS 2200 Advanced Copier** ranks as the #1 revenue-generating product across the Central, East, and West regions.

### 10. Customer Segmentation into Sales Quartiles (Complex)
* **Question:** How can we segment customers into 4 distinct spending tiers using windowing functions (`NTILE`)?
* **Insight:** Customers were categorized into 4 tiers. Quartile 1 holds the top-tier accounts, providing a clear segment for targeted enterprise loyalty campaigns.

---

## Project Status
**Status:** Completed
