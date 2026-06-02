-- Task: Total Spend by Customer Segment
-- Show the total spend, total debit transactions, and average debit amount for each customer segment,
SELECT full_name,
    segment,
    SUM(
        CASE
            WHEN txn_type = 'debit' THEN amount
            ELSE 0
        END
    ) AS total_spend,
    COUNT(
        CASE
            WHEN txn_type = 'debit' THEN 1
            ELSE NULL
        END
    ) AS total_debit_transactions,
    ROUND(
        SUM(
            CASE
                WHEN txn_type = 'debit' THEN amount
                ELSE 0
            END
        ) / COUNT(
            CASE
                WHEN txn_type = 'debit' THEN 1
                ELSE NULL
            END
        ),
        2
    ) AS average_debit_amount
FROM customers
    JOIN accounts ON customers.customer_id = accounts.customer_id
    JOIN transactions ON accounts.account_id = transactions.account_id
GROUP BY full_name,
    segment
ORDER BY total_spend DESC
LIMIT 5;