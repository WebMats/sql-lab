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