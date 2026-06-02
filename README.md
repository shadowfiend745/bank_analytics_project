# bank_analytics_project

A end-to-end SQL analytics project simulating real-world customed data analysis at a retail bank. Built to demonstrate intermediate-to-advanced PostgreSQL skills including window functions, CTEs, cohort analysis, and dormant account detection.

---

## Tech Stack

- **Database:** PostgreSQL 18
- **Query Tool:** pgAdmin 4 / SQLTools (VS Code)
- **Language:** SQL (PostgreSQL dialect)

---

## Schema Design

Three normalized tables with enforced foreign key relationships:

```
customers      → customer_id, full_name, email, city, join_date, credit_score, segment
accounts       → account_id, customer_id, account_type, balance, opened_date, status
transactions   → transaction_id, account_id, amount, txn_type, transaction_date, category, description
```

**Key design decisions:**
- `txn_type` column (`credit`/`debit`) with always-positive `amount` — chosen over negative amounts for cleaner analytical queries
- `segment` column (`retail`, `premium`, `corporate`) enables customer-level behavioral segmentation
- Foreign keys enforced at the schema level to maintain referential integrity
- `NOT NULL` constraints on all critical columns to prevent dirty data

---

## Tasks

### Monthly Transaction Trends (`monthly_transaction.sql`)
**Business question:** How is the bank performing month by month in terms of cash flow?

Aggregates total credits, debits, net amount, and transaction count per month.

**Finding:** March, May, and July showed negative net flow — total debits exceeded credits. In a production dataset this would trigger further investigation into customer spending patterns.

---

### Top Customers by Total Spend (`total_spend.sql`)
**Business question:** Which customers are driving the most transaction volume?

JOINs all three tables to calculate total spend, debit transaction count, and average transaction size per customer.

**Finding:** With only 5 customers, segment-level conclusions are limited. However, average transaction size varied significantly across customers regardless of segment — highlighting that individual behavior matters more than segment label at small scale.

---

### Customer Activity Segmentation (`customer_activity.sql`)
**Business question:** How active are our customers and how do we classify them?

Uses a CTE to calculate total transactions per customer, then applies `CASE WHEN` logic to classify into High (>5), Moderate (3–5), and Low (<3) activity tiers.

**Finding:** Bob Smith and Alice Johnson are high-activity customers. Charlie Brown and Ethan Hunt fall into moderate activity. No customers fall into low activity — suggesting the dataset skews toward engaged customers.

---

### Month-over-Month Growth Rate (`monthly_growth_rate_per_account.sql`)
**Business question:** Is credit activity growing or shrinking for each account over time?

Uses `LAG()` window function partitioned by `account_id` to compare each month's credits against the previous month, calculating percentage growth.

**Finding:** Most accounts showed -100% growth in subsequent months due to sparse seed data. In a production dataset with continuous transaction history, this query would surface meaningful growth trends per account.

---

### Dormant Account Detection (`dormant_account_detection.sql`)
**Business question:** Which accounts have gone inactive and may need re-engagement?

Uses `MAX(transaction_date)` as a reference point and calculates days since last transaction per account. Flags accounts with no activity in 90+ days.

**Finding:** 6 out of 8 accounts are dormant by the 90-day threshold, including both closed and active accounts. Notably, account 105 (active status) has been inactive for 108 days — a candidate for re-engagement outreach. Closed accounts appearing in results suggests a production query should add a `WHERE status = 'active'` filter.

---

### Cohort Retention Analysis (`cohort_retention_analysis.sql`)
**Business question:** Do customers who joined in the same month retain and stay active over time?

Groups customers by join month (cohort), tracks which months they were active post-joining, and counts active customers per cohort per period. Built using three chained CTEs.

**Finding:** All cohorts show activity in the first 1–2 months after joining. No cohort data extends beyond 4 months due to the limited dataset timeframe. In production, this query would reveal retention dropoff curves.

---

## How to Run

1. Install PostgreSQL and pgAdmin 4
2. Create a database called `bank_analytics`
3. Run `schema.sql` to create the tables
4. Run `data_source.sql` to insert seed data
5. Run any mission file independently to reproduce the analysis

---

## Project Structure

```
bank-analytics-sql/
├── README.md
├── schema.sql
├── data_source.sql
├── monthly_transaction.sql
├── total_spend.sql
├── customer_activity.sql
├── monthly_growth_rate_per_account.sql
├── dormant_account_detection.sql
└── cohort_retention_analysis.sql
```