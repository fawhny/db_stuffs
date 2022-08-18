-- Query 1
-- this query displays the flavor id, flavor name, and status for in stock flavors beginning with the letter 'b'
SELECT flavor_id AS "Flavor ID",
       flavor_name AS "Flavor",
       in_stock AS "Stock Status"
FROM
ice_creame
WHERE in_stock = 'Y' AND flavor_name LIKE 'B%'
ORDER BY 2
;

-- Query 2
-- this query displays the employee id, employee name, and their role--as entered by the user
-- roles are: manager, assistant manager, cashier, and server
SELECT employee_id AS "Employee ID",
       e_first || ' ' || e_last AS "Employee",
       e_role AS "Role"
FROM employee
WHERE UPPER(e_role) LIKE UPPER('&role')
ORDER BY e_last
;

-- Query 3
-- this query displays the sale id, employee id, sale amount, and the date of sale for the month of january
-- this query fetches only the first 50 rows
SELECT sale_id AS "Sale ID",
       employee_employee_id AS "Employee ID",
       amount AS "Amount of Sale",
       sale_date AS "Sale Date"
FROM sale
WHERE sale_date BETWEEN '01-JAN-20' AND '31-JAN-20'
ORDER BY sale_date
FETCH FIRST 50 ROWS ONLY
;

-- team nine
-- 2.15.2020

-- Query4
-- this query returns the flavor name, stock id, and stock status of an ice creame flavor based on a one word input from the user
SELECT flavor_name AS "Flavor",
       LPAD(stock_id, 14, '*') AS "Stock ID",
       in_stock AS "Stock Status"
FROM ice_creame
WHERE UPPER(SUBSTR(flavor_name, 1, LENGTH(flavor_name))) LIKE UPPER('%&ice_creame_word%')
ORDER BY 2
;

-- Query5
-- this query returns the inventory id, item name, last order date, and the months since the last order date of all items in inventory table
SELECT inv_id AS "Inventory ID",
       item_name AS "Item Name",
       last_order_date AS "Last Order Date",
       ROUND(MONTHS_BETWEEN(SYSDATE, last_order_date)) AS "Months Since Last Reorder"
FROM inventory
ORDER BY 1
;

-- team nine
-- 2.21.2020

-- Query 6
-- this query returns the sale_id and the total amount of the sale for sales occuring on january 1 2020
SELECT sale_id AS "Transaction ID",
       TO_CHAR(amount, '$999,999.00') AS "Sale Amount",
       sale_date AS "Day of Sale"
FROM sale
WHERE sale_date = TO_DATE('January 1, 2020', 'MM DD, YYYY')
ORDER BY 1, 2
;

-- Query 7
-- this query returns the employees first and last names and address and the county based upon their given city
SELECT e_first || ' ' || e_last AS "Employee",
       e_street || ' ' || e_city || ' ' || e_zip AS "Address",
       (CASE WHEN e_city IN ('Brookhaven', 'Dunwoody','Chamblee', 'Doraville')  THEN 'DEKALB'
             WHEN e_city IN ('Sandy Springs','Roswell', 'Johns Creek', 'College Park') THEN 'FULTON'
             WHEN e_city IN ('Smyrna') THEN 'COBB'
             ELSE 'INVALID'
       END) AS "County"
FROM employee
ORDER BY 3
;

-- team nine
-- 3.2.2020

-- Query 8
-- this query returns the employee roles and the number of employees assigned to each role

SELECT  e_role AS "Role",
        COUNT(employee_id) AS "Number of Employees"
FROM employee
GROUP BY e_role
ORDER BY e_role
;


-- Query 9
/* this query returns the min, maximum, and sum total amount of sales for
the month value entered by the user where the sum is greater than the max*/

SELECT TO_CHAR(MIN(amount), 'fm$999,999.00') AS "Minimum Sale",
        TO_CHAR(MAX(amount), 'fm$999,999.00') AS "Maximum Sale",
        TO_CHAR(SUM(amount), 'fm$999,999.00') AS "Total Sale Amount for: &Month"
FROM sale
WHERE UPPER(SUBSTR(sale_date, 4, 3)) LIKE UPPER('&Month')
HAVING SUM(amount) > MAX(amount)
ORDER BY sale_date
;

-- team nine
-- 3.15.2020

-- Query 10
-- this query returns the ice-cream flavor(s) and transaction id of each sale.
SELECT i.flavor_name AS "Ice-Creame",
       f.sale_sale_id AS "Transaction ID"
FROM ice_creame i JOIN flavors f
                  ON i.flavor_id = f.ice_creame_flavor_id
ORDER BY 2
;

-- Query 11
-- this query returns the name, job, sale amount, and sale date, associated will all emlpoyees that have made sales
SELECT e.e_first || ' ' || e.e_last AS "Employee",
       e.e_role AS "Job Title",
       TO_CHAR(s.amount, '$999,999.99') AS "Sale Amount",
       TO_CHAR(s.sale_date, 'fmMON DD, YYYY') AS "Sale Date"
FROM employee e FULL OUTER JOIN sale s ON e.employee_id = s.employee_employee_id
ORDER BY 4
;

-- team nine
-- 4.3.2020

-- Query 12
-- this query displays the items, price, amount on hand, and last order date of items with a last order date equal to that of item 1
SELECT INITCAP(item_name) AS "Item Name",
       TO_CHAR(item_price, 'fm$999,999.00') AS "Item Price",
       amount_on_hand AS "Amount on Hand",
       TO_CHAR(last_order_date, 'fmMon dd, yyyy') AS "Last Order Date"
FROM inventory
WHERE last_order_date = (SELECT last_order_date
                         FROM inventory
                         WHERE inv_id = 1)
ORDER BY item_price
;

-- Query 13
-- this query displays the employees who have made sales totaling an amount greater than the avergae sale amount
SELECT e_first || ' ' || e_last AS "Employees With Above Average Sales",
       employee_id AS "Employee ID"
FROM employee
WHERE employee_id IN (SELECT employee_employee_id
                      FROM sale s
                      WHERE amount > (SELECT AVG(amount)
                                     FROM sale))
ORDER BY 2
;

-- team nine
-- 4.25.2020

-- Query 14
-- this query displays all item and equipment names used by the shoppe categorized by type (item or equipment)
SELECT equipment_name AS "Name", 'Equipment' AS "Category"
FROM equipment
UNION
SELECT item_name, 'Items'
FROM inventory
ORDER BY 2
;

-- Query 15
-- this query displays all of the flavor ids and names of ice-creames that have not been sold
SELECT flavor_id AS "Flavor ID", flavor_name AS "Unsold Ice-Creame Flavors"
FROM ice_creame
MINUS
SELECT f.ice_creame_flavor_id, i.flavor_name 
FROM flavors f JOIN ice_creame i ON f.ice_creame_flavor_id = i.flavor_id
ORDER BY 1
;