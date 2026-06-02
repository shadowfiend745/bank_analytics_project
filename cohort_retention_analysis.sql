-- Task: Perform a cohort analysis to understand customer retention over time.
-- The analysis will group customers by their join month and year, and then track their activity in subsequent months to see how many remain active.
WITH cohort_dates AS (
    SELECT customer_id,
        EXTRACT(
            MONTH
            FROM join_date
        ) AS cohort_month,
        EXTRACT(
            YEAR
            FROM join_date
        ) AS cohort_year
    FROM customers
),
transactions_date AS (
    SELECT DISTINCT cd.customer_id,
        EXTRACT(
            MONTH
            FROM transaction_date
        ) AS transaction_month,
        EXTRACT(
            YEAR
            FROM transaction_date
        ) AS transaction_year
    FROM customers cd
        JOIN accounts ON cd.customer_id = accounts.customer_id
        JOIN transactions ON accounts.account_id = transactions.account_id
),
cohort_months_calculation AS (
    SELECT cd.customer_id,
        cd.cohort_month,
        cd.cohort_year,
        td.transaction_month,
        td.transaction_year,
        (td.transaction_year - cd.cohort_year) * 12 + (td.transaction_month - cd.cohort_month) AS months_since_join
    FROM cohort_dates cd
        JOIN transactions_date td ON cd.customer_id = td.customer_id
)
SELECT cmc.cohort_year,
    cmc.cohort_month,
    cmc.months_since_join,
    COUNT(DISTINCT cmc.customer_id) AS active_customers
FROM cohort_months_calculation cmc
WHERE cmc.months_since_join >= 0
GROUP BY cmc.cohort_year,
    cmc.cohort_month,
    cmc.months_since_join;