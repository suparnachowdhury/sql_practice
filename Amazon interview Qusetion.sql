
-- drop table online_retails;

CREATE TABLE online_retails (
    country VARCHAR(10),
    customerid FLOAT,
    description VARCHAR(10),
    invoicedate DATETIME,
    invoiceno VARCHAR(10),
    quantity BIGINT,
    stockcode VARCHAR(10),
    unitprice FLOAT
);

INSERT INTO online_retails (country, customerid, description, invoicedate, invoiceno, quantity, stockcode, unitprice)
VALUES
    ('USA', 12345, 'Product A', '2024-10-12 12:00:00', 'INV001', 5, 'A123', 10.50),
    ('UK', 67890, 'Product B', '2024-10-15 14:30:00', 'INV002', 2, 'B456', 20.75),
    ('Canada', 11223, 'Product C', '2024-10-23 16:45:00', 'INV003', 10, 'C789', 15.00),
    ('USA', 22334, 'Product A', '2024-10-24 10:15:00', 'INV004', 3, 'A123', 10.50),
    ('Canada', 33445, 'Product B', '2024-11-05 11:30:00', 'INV005', 7, 'B456', 20.75),
    ('USA', 44556, 'Product C', '2024-11-06 13:00:00', 'INV006', 12, 'C789', 15.00),
    ('Canada', 55667, 'Product A', '2024-11-17 14:20:00', 'INV007', 4, 'A123', 10.50),
    ('USA', 66778, 'Product B', '2024-11-28 15:45:00', 'INV008', 6, 'B456', 20.75),
    -- Additional December 2024 data
    ('USA', 78901, 'Product C', '2024-12-03 09:00:00', 'INV009', 8, 'C789', 15.00),
    ('UK', 89012, 'Product A', '2024-12-10 10:30:00', 'INV010', 5, 'A123', 10.50),
    ('Canada', 12367, 'Product B', '2024-12-15 13:45:00', 'INV011', 3, 'B456', 20.75),
    ('USA', 23489, 'Product A', '2024-12-18 11:00:00', 'INV012', 7, 'A123', 10.50);



	select * from online_retails;

	WITH cte AS (
SELECT MONTH(invoicedate) as month
	,description
	, MAX(unitprice * quantity) as max_price
	FROM online_retails
GROUP BY MONTH(invoicedate), description)
SELECT month,
       MAX(max_price)
from cte
GROUP BY month
;