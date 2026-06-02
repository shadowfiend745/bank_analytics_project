INSERT INTO customers
VALUES (
        1,
        'Alice Johnson',
        'alice.johnson@example.com',
        'Mississauga',
        '2023-01-15',
        750,
        'premium'
    ),
    (
        2,
        'Bob Smith',
        'bob.smith@example.com',
        'Toronto',
        '2023-02-20',
        700,
        'retail'
    ),
    (
        3,
        'Charlie Brown',
        'charlie.brown@example.com',
        'Vancouver',
        '2023-03-10',
        650,
        'corporate'
    ),
    (
        4,
        'Diana Prince',
        'diana.prince@example.com',
        'Montreal',
        '2023-04-05',
        720,
        'premium'
    ),
    (
        5,
        'Ethan Hunt',
        'ethan.hunt@example.com',
        'Calgary',
        '2023-05-15',
        680,
        'retail'
    );
INSERT INTO accounts
VALUES (
        101,
        1,
        'savings',
        5000.00,
        '2023-01-16',
        'active'
    ),
    (
        102,
        1,
        'checking',
        3000.00,
        '2023-01-01',
        'active'
    ),
    (
        103,
        2,
        'checking',
        2000.00,
        '2023-01-17',
        'active'
    ),
    (
        104,
        2,
        'savings',
        3000.00,
        '2023-02-21',
        'closed'
    ),
    (
        105,
        3,
        'checking',
        1500.00,
        '2023-03-11',
        'active'
    ),
    (
        106,
        4,
        'savings',
        7000.00,
        '2023-04-06',
        'closed'
    ),
    (
        107,
        4,
        'checking',
        2500.00,
        '2023-05-16',
        'active'
    ),
    (
        108,
        5,
        'checking',
        4000.00,
        '2023-05-18',
        'active'
    );
INSERT INTO transactions
VALUES (
        1001,
        101,
        201.10,
        'credit',
        '2023-02-14',
        'transfer',
        'transfer from checking to savings'
    ),
    (
        1002,
        102,
        2011.00,
        'credit',
        '2023-02-14',
        'salary',
        'biweekly salary deposit'
    ),
    (
        1003,
        102,
        195.00,
        'debit',
        '2023-02-20',
        'groceries',
        'biweekly grocery shopping'
    ),
    (
        1004,
        102,
        347.00,
        'debit',
        '2023-02-28',
        'utilities',
        'monthly utility bill payment'
    ),
    (
        1005,
        102,
        2011.00,
        'credit',
        '2023-02-28',
        'salary',
        'biweekly salary deposit'
    ),
    (
        1006,
        102,
        1500.00,
        'debit',
        '2023-03-01',
        'rent',
        'monthly rent payment'
    ),
    (
        1007,
        102,
        67.50,
        'debit',
        '2023-03-05',
        'dining',
        'dining out with friends'
    ),
    (
        1008,
        102,
        120.00,
        'debit',
        '2023-03-10',
        'entertainment',
        'movie tickets and snacks'
    ),
    (
        1009,
        103,
        488.00,
        'debit',
        '2023-01-20',
        'furniture',
        'new home office desk and chair'
    ),
    (
        1010,
        103,
        80.00,
        'debit',
        '2023-01-20',
        'dining',
        'dining out with family'
    ),
    (
        1011,
        103,
        4100.00,
        'credit',
        '2023-01-31',
        'salary',
        'monthly salary deposit'
    ),
    (
        1012,
        103,
        400.00,
        'debit',
        '2023-02-15',
        'ATM',
        'cash withdrawal from ATM'
    ),
    (
        1013,
        103,
        70.00,
        'debit',
        '2023-02-20',
        'gym',
        'monthly gym membership fee'
    ),
    (
        1014,
        103,
        150.00,
        'debit',
        '2023-02-25',
        'utilities',
        'monthly utility bill payment'
    ),
    (
        1015,
        103,
        4100.00,
        'credit',
        '2023-02-28',
        'salary',
        'monthly salary deposit'
    ),
    (
        1016,
        104,
        60.00,
        'credit',
        '2023-03-01',
        'interest',
        'monthly interest credit'
    ),
    (
        1017,
        104,
        321.50,
        'credit',
        '2023-03-03',
        'transfer',
        'monthly credit transfer from checking to savings'
    ),
    (
        1018,
        104,
        1200.00,
        'debit',
        '2023-04-20',
        'medical',
        'emergency medical expenses'
    ),
    (
        1019,
        105,
        1800.00,
        'credit',
        '2023-04-15',
        'salary',
        'biweekly salary deposit'
    ),
    (
        1020,
        105,
        1800.00,
        'credit',
        '2023-04-30',
        'salary',
        'biweekly salary deposit'
    ),
    (
        1021,
        105,
        21.99,
        'debit',
        '2023-05-01',
        'subscription',
        'monthly game subscription fee'
    ),
    (
        1022,
        105,
        750.00,
        'debit',
        '2023-05-20',
        'car_payment',
        'monthly car payment'
    ),
    (
        1023,
        106,
        1000.00,
        'credit',
        '2023-04-30',
        'transfer',
        'monthly credit transfer from checking to savings'
    ),
    (
        1024,
        106,
        240.00,
        'credit',
        '2023-05-06',
        'interest',
        'monthly interest credit'
    ),
    (
        1025,
        107,
        1100.00,
        'debit',
        '2023-06-01',
        'mortgage',
        'monthly mortgage payment'
    ),
    (
        1026,
        107,
        180.00,
        'debit',
        '2023-06-10',
        'dining',
        'dining out with family'
    ),
    (
        1027,
        107,
        2600.00,
        'credit',
        '2023-06-15',
        'salary',
        'biweekly salary deposit'
    ),
    (
        1028,
        107,
        370.00,
        'debit',
        '2023-06-28',
        'utilities',
        'monthly utility bill payment'
    ),
    (
        1029,
        108,
        1500.00,
        'credit',
        '2023-06-15',
        'salary',
        'biweekly salary deposit'
    ),
    (
        1030,
        108,
        200.00,
        'debit',
        '2023-06-27',
        'entertainment',
        'concert tickets and merchandise'
    ),
    (
        1031,
        108,
        300.00,
        'debit',
        '2023-06-30',
        'travel',
        'weekend getaway trip expenses'
    ),
    (
        1032,
        108,
        1500.00,
        'debit',
        '2023-07-01',
        'mortgage',
        'monthly mortgage payment'
    ),
    (
        1033,
        108,
        675.00,
        'debit',
        '2023-09-05',
        'car_payment',
        'monthly car payment'
    );