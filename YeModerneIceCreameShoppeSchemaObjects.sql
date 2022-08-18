-- team nine
-- 4.18.2020
-- Schema Objects


-- view 1
CREATE OR REPLACE VIEW equipvue
AS SELECT equipment_id, equipment_name, date_serviced, employee_employee_id
    FROM equipment e JOIN equipment_service s ON e.equipment_id = s.equipment_equipment_id
WHERE employee_employee_id IN (SELECT employee_id
                               FROM employee)
;
    
SELECT * FROM equipvue;

-- view 1 query
/* this query displays the name of the equipment, the date it was serviced, 
and the employee id of the employee who authorized the service */
SELECT equipment_name AS "Appliance",
       date_serviced AS "Service Date",
       employee_employee_id AS "Employee ID of Authorizer"
FROM equipvue
WHERE date_serviced <> SYSDATE
ORDER BY date_serviced, 3
;


-- view 2
CREATE OR REPLACE VIEW employvue
AS SELECT e.employee_id,
          e_first,
          e_last,
          e_zip,
          e_phone,
          e_role,
          COUNT(s.sale_id) AS "Number of Sales"
    FROM employee e JOIN sale s ON e.employee_id = s.employee_employee_id
    GROUP BY e.employee_id, e_first, e_last, e_zip, e_phone,  e_role
    HAVING e_role NOT LIKE '%Man%'
;

SELECT * FROM employvue;

-- view 2 query
-- this query displays the total number of sales for all employees labeled as cashier
SELECT e_first || ' ' || e_last AS "Employee",
       "Number of Sales",
       e_role AS "Job"
FROM employvue
WHERE e_role LIKE 'Cash%'
ORDER BY employee_id
;

-- index
-- this is an index of the names of the provided ice creames

DROP INDEX ice_creame_flavor_idx;
CREATE INDEX ice_creame_flavor_idx
        ON ice_creame (flavor_name);


-- flashback exercise
CREATE TABLE TEMP_SP(message VARCHAR2(40));
INSERT INTO TEMP_SP VALUES ('i scream for ice-creame');
SELECT * FROM TEMP_SP;
DROP TABLE TEMP_SP;
SELECT * FROM TEMP_SP;
FLASHBACK TABLE TEMP_SP TO BEFORE DROP;
SELECT * FROM TEMP_SP;