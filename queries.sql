-- find all customers that live in London. Returns 6 records.
SELECT *
FROM customers
WHERE city="London"

-- find all customers with postal code 1010. Returns 3 customers.
SELECT *
FROM customers
WHERE postalcode="1010"

-- find the phone number for the supplier with the id 11. Should be (010) 9984510.
SELECT *
FROM suppliers
WHERE supplierid=11

-- list orders descending by the order date. The order with date 1997-02-12 should be at the top.
SELECT * 
FROM orders
ORDER BY orderdate DESC

-- find all suppliers who have names longer than 20 characters. You can use length(SupplierName) to get the length of the name. Returns 11 records.
SELECT *
FROM suppliers
WHERE LENGTH(suppliername) > 20

-- find all customers that include the word "market" in the name. Should return 4 records.
SELECT *
FROM customers
WHERE customername LIKE '%market%'

-- add a customer record for "The Shire", the contact name is "Bilbo Baggins" the address is "1 Hobbit-Hole" in "Bag End", postal code "111" and the country is "Middle Earth".
INSERT INTO 
    customers (customername, contactname, address, city, postalcode, country) 
    VALUES ('The Shire', 'Bilbo Baggins', '1 Hobbit-Hole', 'Bag End', '111', 'Middle Earth')

-- update Bilbo Baggins record so that the postal code changes to "11122".
UPDATE customers 
SET postalcode="11122"
WHERE city="Bag End"



-- STRETCH PROBLEMS
-- list orders grouped by customer showing the number of orders per customer. Rattlesnake Canyon Grocery should have 7 orders.
SELECT customername, 
COUNT(orders.customerid) AS 'number of orders'
FROM customers
LEFT JOIN orders 
ON customers.customerid = orders.customerid
GROUP BY orders.customerid

-- list customers names and the number of orders per customer. Sort the list by number of orders in descending order. Ernst Handel should be at the top with 10 orders followed by QUICK-Stop, Rattlesnake Canyon Grocery and Wartian Herkku with 7 orders each.
SELECT customername, 
COUNT(orders.customerid) AS 'number of orders'
FROM customers
LEFT JOIN orders 
ON customers.customerid = orders.customerid
GROUP BY orders.customerid
ORDER BY 2 DESC

-- list orders grouped by customer's city showing number of orders per city. Returns 58 Records with Aachen showing 2 orders and Albuquerque showing 7 orders.
SELECT city,
COUNT(orders.customerid) AS 'number of orders'
FROM customers
CROSS JOIN orders 
ON customers.customerid = orders.customerid
GROUP BY city

-- delete all customers that have no orders. Should delete 17 (or 18 if you haven't deleted the record added) records.
DELETE FROM customers
WHERE customerid IN (
    SELECT customers.customerid FROM customers
    LEFT JOIN orders
    ON customers.customerid = orders.customerid
    WHERE orderid IS NULL
    GROUP BY customers.customerid
);