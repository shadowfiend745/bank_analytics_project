-- Task: Calculate the monthly growth rate of total credit transactions for each account.
-- The growth rate is calculated as: ((current_month_credit - previous_month_credit) / previous_month_credit) * 100
WITH monthly_transactions AS (
    SELECT account_id,
        EXTRACT(
            YEAR
            FROM transaction_date
        ) AS year,
        EXTRACT(
            MONTH
            FROM transaction_date
        ) AS month,
        SUM(
            CASE
                WHEN txn_type = 'credit' THEN amount
                ELSE 0
            END
        ) AS total_credit
    FROM transactions
    GROUP BY account_id,
        year,
        month
),
monthly_growth_rate AS (
    SELECT account_id,
        year,
        month,
        total_credit,
        LAG(total_credit) OVER(
            PARTITION BY account_id
            ORDER BY year,
                month
        ) AS previous_month_credit
    FROM monthly_transactions
)
SELECT account_id,
    year,
    month,
    total_credit,
    previous_month_credit,
    ROUND(
        (total_credit - previous_month_credit) / previous_month_credit * 100,
        2
    ) AS monthly_growth_rate
FROM monthly_growth_rate
WHERE previous_month_credit IS NOT NULL;