CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    join_date DATE NOT NULL,
    credit_score INT NOT NULL,
    segment VARCHAR(20) NOT NULL
);
CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    account_type VARCHAR(20) NOT NULL,
    balance DECIMAL(15, 2) NOT NULL,
    opened_date DATE NOT NULL,
    status VARCHAR(10) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT NOT NULL,
    amount DECIMAL(15, 2) NOT NULL,
    txn_type VARCHAR(10) NOT NULL,
    transaction_date DATE NOT NULL,
    category VARCHAR(50) NOT NULL,
    description VARCHAR(255),
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);