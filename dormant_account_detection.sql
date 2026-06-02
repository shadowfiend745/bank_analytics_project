-- Task: Identify dormant accounts that have not had any transactions in the last 90 days.
-- A dormant account is defined as an account that has not had any transactions for more than 90 days from the reference date (the most recent transaction date in the dataset).
WITH reference_date AS (
    SELECT MAX(transaction_date) AS ref_date
    FROM transactions
),
last_transactions AS (
    SELECT account_id,
        ref_date,
        MAX(transaction_date) AS last_transaction_date
    FROM transactions,
        reference_date
    GROUP BY account_id,
        ref_date
),
inactive_accounts AS (
    SELECT account_id,
        ref_date,
        last_transaction_date,
        ref_date - last_transaction_date AS days_inactive
    FROM last_transactions
)
SELECT ia.account_id,
    a.account_type,
    a.status,
    ia.last_transaction_date,
    ia.days_inactive
FROM accounts a
    JOIN inactive_accounts ia ON a.account_id = ia.account_id
WHERE ia.days_inactive > 90
ORDER BY ia.days_inactive DESC;