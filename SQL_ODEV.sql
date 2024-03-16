SELECT product_name, quantity_per_unit
FROM Products;

SELECT product_id, product_name from products where discontinued= 0;

SELECT product_id FROM products Where discontinued=0;

SELECT product_id, product_name, unit_price FROM products WHERE unit_price<20;

SELECT product_id, product_name, unit_price FROM products WHERE unit_price BETWEEN 15 AND 25;

SELECT product_id, units_on_order, units_in_stock FROM products WHERE units_in_stock < units_on_order;

SELECT product_id FROM products WHERE product_name LIKE 'a%';

SELECT  product_name  FROM  products  WHERE  product_name LIKE '%i';

SELECT  product_name , unit_price, unit_price  * 1.18 AS unit_price_kdv FROM  products;

SELECT COUNT(*) FROM products  WHERE unit_price > 30;

SELECT LOWER(product_name) AS product_name_lower, unit_price FROM products ORDER BY unit_price DESC;

SELECT first_name || ' ' || last_name AS full_name FROM employees;

SELECT COUNT(*) FROM Suppliers WHERE Region IS NULL;

SELECT COUNT(*) FROM Suppliers WHERE Region IS NOT NULL;

SELECT CONCAT('TR ', UPPER(product_name)) AS product_name FROM products;

SELECT CONCAT('TR ', UPPER(product_name)) AS product_name FROM products;

SELECT CONCAT('TR ', UPPER(product_name)) AS product_name FROM products WHERE unit_price <20;

SELECT product_name,unit_price  FROM products ORDER BY  unit_price DESC LIMIT 1;

SELECT product_name,unit_price  FROM products ORDER BY  unit_price DESC LIMIT 10;

SELECT  product_name,unit_price  FROM products WHERE unit_price  > (SELECT AVG(unit_price ) FROM products);

SELECT p. product_id, p. product_name, s. company_name, s. phone FROM products p JOIN suppliers s ON p. supplier_id = s. supplier_id WHERE p. units_in_stock = 0;

SELECT o. ship_address, e. first_name, e. last_name FROM Orders o JOIN employees e ON o. employee_id = e. employee_id WHERE EXTRACT(YEAR FROM o. order_date) = 1998 AND EXTRACT(MONTH FROM o. order_date) = 3;

SELECT COUNT(*) AS siparis_sayisi FROM orders WHERE EXTRACT(YEAR FROM order_date) = 1997 AND EXTRACT(MONTH FROM order_date) = 2;

SELECT COUNT(*) AS siparis_sayisi FROM orders o JOIN customers c ON o. customer_id = c. customer_id AND c. city = 'London';

SELECT DISTINCT c. contact_name, c. phone FROM customers c JOIN orders o ON c. customer_id = o. customer_id WHERE EXTRACT(YEAR FROM o. order_date) = 1997;

SELECT * FROM orders WHERE freight >= 40;

SELECT o. ship_city, c. contact_name FROM orders o JOIN customers c ON o. customer_id = c.  customer_id WHERE o. freight >= 40;

SELECT o. order_date , c. city, CONCAT(UPPER(e. first_name), ' ', UPPER(e. last_name)) AS employee_name FROM orders o JOIN customers c ON o. customer_id = c. customer_id
JOIN employees e ON o. employee_id = e. employee_id WHERE EXTRACT(YEAR FROM o. order_date) = 1997;

SELECT c. contact_name, REPLACE(REPLACE(REPLACE(c. phone, '(', ''), ')', ''), ' ', '') AS phone_number FROM customers c JOIN orders o ON c. customer_id = o. customer_id
WHERE EXTRACT(YEAR FROM o. order_date) = 1997;

SELECT o. order_date, c. contact_name, e. first_name AS employee_first_name, e. last_name AS employee_last_name
FROM orders o JOIN customers c ON o. customer_id = c. customer_id JOIN employees e ON o. employee_id = e. employee_id;

36,?
SELECT * FROM orders WHERE shipped_date IS NULL AND CURRENT_DATE - require_date > INTERVAL '7 days';

SELECT o. order_date, c. contact_name FROM orders o JOIN customers c ON o. customer_id = c. customer_id
WHERE o. shipped_date IS NULL AND CURRENT_DATE - o. required_date > INTERVAL '7 days';

SELECT p. product_name, c. category_name, od. quantity FROM order_details od JOIN products p ON od. product_id = p. product_id JOIN categories c ON p. category_id = c. category_id
WHERE od. order_id= 10248;

SELECT p. product_name, s. company_name AS supplier_name FROM order_details od JOIN products p ON od. product_id = p. product_id
JOIN suppliers s ON p. supplier_id = s. supplier_id WHERE od. order_id = 10248;

SELECT p. product_name, s. company_name AS supplier_name FROM order_details od JOIN products p ON od. product_id = p. product_id
JOIN suppliers s ON p. supplier_id = s. supplier_id WHERE od. order_id = 10248;

SELECT e. employee_id, CONCAT(e. first_name, ' ', e. last_name) AS full_name FROM orders o JOIN employees e ON o. employee_id = e. employee_id WHERE EXTRACT(YEAR FROM o. order_date) = 1997
GROUP BY e. employee_id, full_name ORDER BY COUNT(*) DESC LIMIT 1;

?
SELECT e. employee_id, CONCAT(e. first_name, ' ', e. last_name) AS full_name FROM orders o JOIN employees e ON o. employee_id = e. employee_id WHERE EXTRACT(YEAR FROM o. order_date) = 1997
GROUP BY e. employee_id, full_name ORDER BY COUNT(*) DESC LIMIT 1;

SELECT p. product_name, p. unit_price, c. category_name FROM products p JOIN categories c ON p. category_id = c. category_id
ORDER BY p. unit_price DESC LIMIT 1;


SELECT e. first_name, e. last_name, o. order_date, o. order_id FROM orders o JOIN employees e ON o. employee_id = e. employee_id
ORDER BY o. order_date;

SELECT AVG(od. unit_price * od. quantity) AS average_price, o. order_id FROM order_details od JOIN orders o ON od. order_id = o. order_id
GROUP BY o. order_id ORDER BY o. order_id DESC LIMIT 5;

SELECT p. product_name, c. category_name, SUM(od. quantity) AS total_sales FROM order_details od JOIN products p ON od. product_id = p. product_id
JOIN categories c ON p. category_id = c. category_id JOIN orders o ON od. order_id = o. order_id WHERE EXTRACT(MONTH FROM o. order_date) = 1 
GROUP BY p. product_name, c. category_name;

SELECT AVG(total_quantity) AS avg_sales FROM (SELECT SUM(od. quantity) AS total_quantity FROM order_details od GROUP BY od. order_id) AS order_totals;

SELECT p. product_name, c. category_name, s. company_name AS supplier_name FROM order_details od JOIN products p ON od. product_id = p. product_id JOIN categories c ON p. category_id = c. category_id
JOIN suppliers s ON p. supplier_id = s. supplier_id GROUP BY p. product_name, c. category_name, s. company_name ORDER BY SUM(od. quantity) DESC
LIMIT 1;

SELECT COUNT(DISTINCT country) AS num_countries FROM customers;

SELECT SUM(od. unit_price * od. quantity) AS total_sales FROM order_details od JOIN orders o ON od. order_id = o. order_id WHERE o. employee_id = 3 AND o. order_date >= DATE_TRUNC('month', CURRENT_DATE) 
AND o. order_date < DATE_TRUNC('month', CURRENT_DATE) + INTERVAL '1 month';

SELECT p. product_name, c. category_name, od. quantity FROM order_details od JOIN products p ON od. product_id = p. product_id 
JOIN categories c ON p. category_id = c. category_id WHERE od. order_id = 10248

SELECT p. product_name, s. company_name AS supplier_name FROM order_details od JOIN products p ON od. product_id = p. product_id 
JOIN suppliers s ON p. supplier_id = s. supplier_id WHERE od. order_id = 10248;

SELECT p. product_name, SUM(od. quantity) AS total_quantity FROM order_details od JOIN orders o ON od. order_id = o. order_id 
JOIN products p ON od. product_id = p. product_id WHERE o. employee_id = 3 AND EXTRACT(YEAR FROM o. order_date) = 1997 GROUP BY p. product_name;

SELECT e. employee_id, CONCAT(e. first_name, ' ', e. last_name) AS full_name FROM orders o JOIN employees e ON o. employee_id = e. employee_id WHERE EXTRACT(YEAR FROM o. order_date) = 1997 
GROUP BY e. employee_id, full_name ORDER BY COUNT(*) DESC LIMIT 1;

SELECT e. employee_id, CONCAT(e. first_name, ' ', e. last_name) AS full_name FROM orders o JOIN employees e ON o. employee_id = e. employee_id WHERE EXTRACT(YEAR FROM o. order_date) = 1997 
GROUP BY e. employee_id, full_name ORDER BY COUNT(*) DESC LIMIT 1;

SELECT p. product_name, p. unit_price, c. category_name FROM products p 
JOIN categories c ON p. category_id = c. category_id ORDER BY p. unit_price DESC LIMIT 1;

SELECT e. first_name, e. last_name, o. order_date, o. order_id FROM orders o 
JOIN employees e ON o. employee_id = e. employee_id ORDER BY o. order_date;

SELECT AVG(od. unit_price * od. quantity) AS average_price, o. order_id FROM order_details od 
JOIN orders o ON od. order_id = o. order_id ORDER BY o. order_date DESC LIMIT 5;*

SELECT p. product_name, c. category_name, SUM(od. quantity) AS total_sales FROM order_details od 
JOIN products p ON od. product_id = p. product_id JOIN categories c ON p. category_id = c. category_id 
JOIN orders o ON od. order_id = o. order_id WHERE EXTRACT(MONTH FROM o. order_date) = 1 
AND EXTRACT(YEAR FROM o. order_date) = 1997 GROUP BY p. product_name, c. category_name;

SELECT od. order_id, SUM(od. quantity) AS total_quantity FROM order_details od JOIN orders o ON od. order_id = o. order_id
GROUP BY od. order_id HAVING SUM(od. quantity) > (SELECT AVG(total_quantity) FROM (SELECT SUM(od. quantity) AS total_quantity FROM order_details od 
JOIN orders o ON od. order_id = o. order_id GROUP BY od. order_id) AS order_totals);

SELECT p. product_name, c. category_name, s. company_name AS supplier_name FROM order_details od JOIN products p ON od. product_id = p. product_id
JOIN categories c ON p. category_id = c. category_id JOIN suppliers s ON p. supplier_id = s. supplier_id
GROUP BY p. product_name, c. category_name, s. company_name ORDER BY SUM(od. quantity) DESC LIMIT 1;

SELECT COUNT(DISTINCT country) AS num_countries FROM customers;

SELECT country, COUNT(*) AS num_customers FROM customers GROUP BY country;

SELECT SUM(od. unit_price * od. quantity) AS total_sales FROM order_details od JOIN orders o ON od. order_id = o. order_id 
WHERE o. employee_id = 3 AND o. order_date >= DATE_TRUNC('month', CURRENT_DATE)
AND o. order_date < DATE_TRUNC('month', CURRENT_DATE) + INTERVAL '1 month';

SELECT SUM(od. unit_price * od. quantity) AS total_revenue FROM order_details od JOIN orders o ON od. order_id = o. order_id
WHERE od. product_id = 10 AND o. order_date >= DATE_TRUNC('month', CURRENT_DATE - INTERVAL '3 month') AND o. order_date < DATE_TRUNC('month', CURRENT_DATE);

SELECT employee_id, COUNT(*) AS total_orders FROM orders GROUP BY employee_id;

SELECT customer_id, company_name FROM customers WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM orders);

SELECT company_name, contact_name AS representative_name, address, city, country FROM customers WHERE country = 'Brazil';

SELECT company_name, contact_name AS representative_name, address, city, country FROM customers WHERE country != 'Brazil';

SELECT company_name, contact_name AS representative_name, address, city, country FROM customers WHERE country IN ('Spain', 'France', 'Germany');

SELECT * FROM customers WHERE fax IS NULL;

SELECT * FROM customers WHERE city IN ('London', 'Paris');

SELECT * FROM customers WHERE city = 'Mexico D.F.' AND contact_title = 'Owner';

SELECT product_name, unit_price FROM products WHERE product_name LIKE 'C%';

SELECT first_name, last_name, birth_date FROM employees WHERE first_name LIKE 'A%';

SELECT company_name FROM customers WHERE company_name LIKE '%RESTAURANT%';

SELECT product_name, unit_price FROM products WHERE unit_price BETWEEN 50 AND 100;

SELECT order_id, order_date FROM orders WHERE order_date BETWEEN '1996-07-01' AND '1996-12-31';

SELECT order_id, order_date FROM orders WHERE order_date BETWEEN '1996-07-01' AND '1996-12-31';

SELECT * FROM customers WHERE country IN ('Spain', 'France', 'Germany');

SELECT * FROM customers WHERE fax IS NULL;

SELECT * FROM customers ORDER BY country;

SELECT product_name, unit_price FROM products ORDER BY unit_price DESC;

SELECT product_name, unit_price FROM products ORDER BY unit_price DESC, units_in_stock;

SELECT COUNT(*) FROM products WHERE category_id = 1;

SELECT COUNT(*) FROM products WHERE category_id = 1;

SELECT COUNT(DISTINCT country) FROM customers;

SELECT DISTINCT country FROM customers;

SELECT DISTINCT country FROM customers;

SELECT product_name, unit_price FROM products ORDER BY unit_price DESC LIMIT 5;

SELECT COUNT(*) FROM orders WHERE customer_id = 'ALFKI';

SELECT SUM(unit_price * units_in_stock) FROM products;

SELECT SUM(od. unit_price * od. quantity) AS total_revenue FROM order_details od JOIN orders o ON od. order_id = o. order_id;

SELECT AVG(unit_price) FROM products;

SELECT product_name FROM products ORDER BY unit_price DESC LIMIT 1;

SELECT MIN(unit_price * quantity) FROM order_details;

SELECT company_name FROM customers ORDER BY LENGTH(company_name) DESC LIMIT 1;

SELECT first_name, last_name, DATE_PART('year', CURRENT_DATE) - DATE_PART('year', birth_date) AS age FROM employees;

SELECT product_id, SUM(quantity) AS total_sold FROM order_details GROUP BY product_id;

SELECT order_id, SUM(unit_price * quantity) AS total_revenue FROM order_details GROUP BY order_id;

SELECT * FROM products WHERE units_in_stock > 1000;

SELECT category_id, COUNT(*) AS total_products FROM products GROUP BY category_id;


SELECT * FROM customers WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM orders);
