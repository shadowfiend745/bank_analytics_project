-- Task: Analyze customer activity by counting the total number of transactions for each customer and 
-- categorizing them into activity levels (High, Moderate, Low) based on their transaction counts.
WITH customer_counts AS (
    SELECT full_name,
        segment,
        COUNT(*) AS total_transactions
    FROM customers
        JOIN accounts ON customers.customer_id = accounts.customer_id
        JOIN transactions ON accounts.account_id = transactions.account_id
    GROUP BY full_name,
        segment
)
SELECT full_name,
    segment,
    total_transactions,
    CASE
        WHEN total_transactions > 5 THEN 'High Activity'
        WHEN total_transactions BETWEEN 3 AND 5 THEN 'Moderate Activity'
        ELSE 'Low Activity'
    END AS activity_level
FROM customer_counts
ORDER BY total_transactions DESC;