-- Task: Monthly Transaction Summary
-- Show the total credit, total debit, net amount, and total transactions counts per month.
SELECT EXTRACT(
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
    ) AS total_credit,
    SUM(
        CASE
            WHEN txn_type = 'debit' THEN amount
            ELSE 0
        END
    ) AS total_debit,
    SUM(
        CASE
            WHEN txn_type = 'credit' THEN amount
            ELSE 0
        END
    ) - SUM(
        CASE
            WHEN txn_type = 'debit' THEN amount
            ELSE 0
        END
    ) AS net_amount,
    COUNT(*) AS total_transactions
FROM transactions
GROUP BY year,
    month
ORDER BY year,
    month;