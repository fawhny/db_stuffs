-- ye olde ice creame shoppe creation
DROP TABLE flavors CASCADE CONSTRAINTS;
DROP TABLE restock CASCADE CONSTRAINTS;
DROP TABLE equipment_service CASCADE CONSTRAINTS;
DROP TABLE sale CASCADE CONSTRAINTS;
DROP TABLE employee CASCADE CONSTRAINTS;
DROP TABLE inventory CASCADE CONSTRAINTS;
DROP TABLE equipment CASCADE CONSTRAINTS;
DROP TABLE ice_creame CASCADE CONSTRAINTS;
DROP SEQUENCE sequence_creame;


-- sequence to create primary key values for table ice_creame
CREATE SEQUENCE sequence_creame
INCREMENT BY 1
START WITH 1;

-- create ice_creame table
CREATE TABLE ice_creame 
(
flavor_id  NUMBER(2),
flavor_name VARCHAR2(40),
in_stock CHAR(2),
last_order_date DATE,
stock_id NUMBER,
CONSTRAINT ice_creame_flavor_id_pk PRIMARY KEY (flavor_id)
);

-- create equipment table
CREATE TABLE equipment
(
equipment_id  NUMBER(2),
equipment_name VARCHAR2(40),
CONSTRAINT equipment_id_pk PRIMARY KEY (equipment_id)
);

-- create inventory table
CREATE TABLE inventory
(
inv_id  NUMBER(2),
item_name VARCHAR2(40),
last_order_date DATE,
item_price NUMBER(6,2),
amount_on_hand VARCHAR2(40),
CONSTRAINT inventory_inv_id_pk PRIMARY KEY (inv_id)
);

-- create employee table
CREATE TABLE employee
(
employee_id NUMBER,
e_first VARCHAR2(40),
e_last VARCHAR2(40),
e_street VARCHAR2(40),
e_city VARCHAR2(20),
e_state CHAR(2),
e_zip VARCHAR2(20),
e_phone VARCHAR2(10),
e_role VARCHAR(40),
CONSTRAINT employee_employee_id_pk PRIMARY KEY (employee_id)
);

-- create sale table
CREATE TABLE sale
(
sale_id NUMBER,
amount NUMBER,
employee_employee_id NUMBER,
sale_date DATE,
CONSTRAINT sale_s_id_pk PRIMARY KEY (sale_id),
CONSTRAINT sale_e_emp_id_fk FOREIGN KEY (employee_employee_id)   REFERENCES employee (employee_id)
);

-- create equipment_service table
CREATE TABLE equipment_service
(
equipment_equipment_id NUMBER,
employee_employee_id NUMBER,
date_serviced DATE,
CONSTRAINT e_service_eq_id_emp_id_pk PRIMARY KEY (equipment_equipment_id, employee_employee_id),
CONSTRAINT e_service_eq_id_fk FOREIGN KEY (equipment_equipment_id)  REFERENCES equipment (equipment_id),
CONSTRAINT e_service_emp_id_fk FOREIGN KEY (employee_employee_id)   REFERENCES employee (employee_id)
);

-- create restock table
CREATE TABLE restock
(
inventory_inv_id NUMBER,
employee_employee_id NUMBER,
order_date DATE,
order_qty NUMBER,
CONSTRAINT restock_inv_id_emp_id_pk PRIMARY KEY (inventory_inv_id, employee_employee_id),
CONSTRAINT restock_inv_id_fk FOREIGN KEY (inventory_inv_id)     REFERENCES inventory (inv_id),
CONSTRAINT restock_emp_id_fk FOREIGN KEY (employee_employee_id) REFERENCES employee (employee_id)
);

-- create flavors table
CREATE TABLE flavors
(
sale_sale_id NUMBER,
ice_creame_flavor_id NUMBER,
CONSTRAINT flavors_sale_id_flavor_id_pk PRIMARY KEY (sale_sale_id, ice_creame_flavor_id),
CONSTRAINT flavors_sale_id_fk FOREIGN KEY (sale_sale_id) REFERENCES sale (sale_id),
CONSTRAINT flavors_flavor_id_fk FOREIGN KEY (ice_creame_flavor_id) REFERENCES ice_creame (flavor_id)
);

-- the ice creame data; primary key id, name, in_stock, stock_date, stock_num
INSERT INTO ice_creame
VALUES (sequence_creame.NEXTVAL, 'Vanilla', 'Y', '25-JAN-20', 111);
INSERT INTO ice_creame
VALUES (sequence_creame.NEXTVAL, 'Chocolate Chip Cookie Dough', 'Y', '25-JAN-20', 112);
INSERT INTO ice_creame
VALUES (sequence_creame.NEXTVAL, 'Cotton Candy', 'Y', '26-JAN-20', 113);
INSERT INTO ice_creame
VALUES (sequence_creame.NEXTVAL, 'Chocolate', 'N', '01-JAN-20', 114);
INSERT INTO ice_creame
VALUES (sequence_creame.NEXTVAL, 'Pistachio', 'N', '01-DEC-19', 115);
INSERT INTO ice_creame
VALUES (sequence_creame.NEXTVAL, 'Bubble Gum', 'Y', '01-JAN-20', 116);
INSERT INTO ice_creame
VALUES (sequence_creame.NEXTVAL, 'Strawberry', 'Y', '01-JAN-20', 117);
INSERT INTO ice_creame
VALUES (sequence_creame.NEXTVAL, 'Moose Tracks', 'Y', '01-FEB-20', 118);
INSERT INTO ice_creame
VALUES (sequence_creame.NEXTVAL, 'Cookies n Cream', 'Y','01-FEB-20', 119);
INSERT INTO ice_creame
VALUES (sequence_creame.NEXTVAL, 'Mint Chocolate Chip', 'N','01-FEB-20', 120);
INSERT INTO ice_creame
VALUES (sequence_creame.NEXTVAL, 'Birthday Cake', 'Y','11-JAN-20', 121);
INSERT INTO ice_creame
VALUES (sequence_creame.NEXTVAL, 'Neopolian', 'Y','01-FEB-20', 122);
INSERT INTO ice_creame
VALUES (sequence_creame.NEXTVAL, 'Cake Batter', 'Y','01-FEB-20', 123);
INSERT INTO ice_creame
VALUES (sequence_creame.NEXTVAL, 'Banana Split', 'N','01-DEC-19', 124);
INSERT INTO ice_creame
VALUES (sequence_creame.NEXTVAL, 'Orange Cream', 'Y','01-FEB-20', 125);
INSERT INTO ice_creame
VALUES (sequence_creame.NEXTVAL, 'Root Beer Float', 'N','01-FEB-20', 126);
INSERT INTO ice_creame
VALUES (sequence_creame.NEXTVAL, 'Bunny Tracks', 'Y','01-FEB-20', 127);
INSERT INTO ice_creame
VALUES (sequence_creame.NEXTVAL, 'Rocky Road', 'N','01-FEB-20', 128);
INSERT INTO ice_creame
VALUES (sequence_creame.NEXTVAL, 'Superman', 'Y','01-FEB-20', 129);
INSERT INTO ice_creame
VALUES (sequence_creame.NEXTVAL, 'Rainbow Sherbert', 'Y','01-FEB-20', 130);

-- equipments data; id, name
INSERT INTO equipment
VALUES(1, 'Walk-In Freezer');
INSERT INTO equipment
VALUES(2, 'Dishwasher');
INSERT INTO equipment
VALUES(3, 'Ice Cream Dipping Cabinets');
INSERT INTO equipment
VALUES(4, 'Waffle Cone Bakers');
INSERT INTO equipment
VALUES(5, 'Sinks');
INSERT INTO equipment
VALUES(6, 'Ice-Cream Scoops');
INSERT INTO equipment
VALUES(7, 'Ice-Cream Dipper Wells');
INSERT INTO equipment
VALUES(8, 'Point of Sale System');
INSERT INTO equipment
VALUES(9, 'Cash Registers');
INSERT INTO equipment
VALUES(10, 'Drop in Ice Cream Freezer');
INSERT INTO equipment
VALUES(11, 'Frost Top');
INSERT INTO equipment
VALUES(12, 'Ice Cream Containers');
INSERT INTO equipment
VALUES(13, 'Ice Cream Maker');

-- inventory data; id, name, last order date, item price, amount on hand
INSERT INTO inventory
VALUES (1, 'Adult Spoons', '01-JAN-20', '20', 500);
INSERT INTO inventory
VALUES (2, 'Kid Spoons', '01-JAN-20', '20', 500);
INSERT INTO inventory
VALUES (3, 'Ice cream Dishes', '01-JAN-20', '40', 100);
INSERT INTO inventory
VALUES (4, 'Disposable Ice Cream Dishes', '01-JAN-20', '5', 500);
INSERT INTO inventory
VALUES (5, 'Sundae Dishes', '01-DEC-19', '30', 100);
INSERT INTO inventory
VALUES (6, 'Napkins', '01-JAN-20', '20', 1000);
INSERT INTO inventory
VALUES (7, 'Sprinkles', '01-JAN-20', '1.50', 900);
INSERT INTO inventory
VALUES (8, 'Gelatin-Free Gummi Bears', '01-DEC-19', '10', 300);
INSERT INTO inventory
VALUES (9, 'Bananas', '01-FEB-20', '.99', 300);
INSERT INTO inventory
VALUES (10, 'Ice Cream Cone Holder', '01-FEB-20', '10', 4);

-- the employee data; id, first and last name, address, phone number, and role
INSERT INTO employee
VALUES (1, 'Carmen', 'Roland', '753 Nature Way', 'Chamblee', 'GA', '30341', '6784379512', 'Manager');
INSERT INTO employee
VALUES (2, 'Artemis', 'Felix', '358 Mulberry Boulevard', 'Doraville', 'GA', '30360', '6789425681', 'Manager');
INSERT INTO employee
VALUES (3, 'Kitty', 'Crowe', '639 Acorn Lane', 'College Park', 'GA', '30337', '4049992761', 'Server');
INSERT INTO employee
VALUES (4, 'Tedii', 'Behr', '093 Salmon Lake', 'Smyrna', 'GA', '30080', '7709011234', 'Server');
INSERT INTO employee
VALUES (5, 'Rudy', 'Coin', '015 Shiny Pebble Street', 'Johns Creek', 'GA', '30329', '6789874156', 'Server');
INSERT INTO employee
VALUES (6, 'Cyrus', 'Adair', '337 Third Eye Circle', 'Brookhaven', 'GA', '30319', '6782137546', 'Server');
INSERT INTO employee
VALUES (7, 'Avery', 'Dallas', '391 Buckle Bunny Boulevard', 'Brookhaven', 'GA', '30319', '4049956596', 'Cashier');
INSERT INTO employee
VALUES (8, 'Rory', 'Mer', '939 Croissant Circle', 'Chamblee', 'GA', '30341', '7705431239', 'Assistant Manager');
INSERT INTO employee
VALUES (9, 'Willow', 'Novak', '021 Figtree Boulevard', 'Doraville', 'GA', '30360', '6789425681', 'Server');
INSERT INTO employee
VALUES (10, 'Guillaume', 'Lacroix', '777 Daydream Avenue', 'Roswell', 'GA', '30077', '7702116998', 'Server');
INSERT INTO employee
VALUES (11, 'Dotty', 'Day', '129 Sunflower Way', 'Brookhaven', 'GA', '30319', '4044126347', 'Cashier');
INSERT INTO employee
VALUES (12, 'Leif', 'Sallow', '793 Mossy Spruce Drive', 'Roswell', 'GA', '30077', '6789021035', 'Cashier');
INSERT INTO employee
VALUES (13, 'Blythe', 'Weingard', '999 Silver Springs Circle', 'Dunwoody', 'GA', '31146', '4049886929', 'Server');
INSERT INTO employee
VALUES (14, 'Teegan', 'Enix', '9011 Cherry Blossom Way', 'Sandy Springs', 'GA', '30305', '4042216616', 'Server');
INSERT INTO employee
VALUES (15, 'Ely', 'Canary', '254 Sugar Gum Street', 'Johns Creek', 'GA', '30329', '7705254431', 'Assistant Manager');

-- sales data; id, amount of sale $$$, and the employee_id who sold, and sale date
INSERT INTO sale    VALUES (1, 10, 7, '01-JAN-20');
INSERT INTO sale    VALUES (2, 20, 2, '01-JAN-20');
INSERT INTO sale    VALUES (3, 25, 1, '11-JAN-20');
INSERT INTO sale    VALUES (4, 5, 6, '21-JAN-20');
INSERT INTO sale    VALUES (5, 15, 4, '31-JAN-20');
INSERT INTO sale    VALUES (6, 25, 3, '31-JAN-20');
INSERT INTO sale    VALUES (7, 10, 15, '31-JAN-20');
INSERT INTO sale    VALUES (8, 5, 13, '01-FEB-20');
INSERT INTO sale    VALUES (9, 3, 11, '01-FEB-20');
INSERT INTO sale    VALUES (10, 5, 13, '01-FEB-20');
INSERT INTO sale    VALUES (11, 3, 14, '03-FEB-20');
INSERT INTO sale    VALUES (12, 20, 7, '03-FEB-20');
INSERT INTO sale    VALUES (13, 10, 12, '05-FEB-20');
INSERT INTO sale    VALUES (14, 25, 4, '06-FEB-20');
INSERT INTO sale    VALUES (15, 25, 9, '06-FEB-20');

-- equipment_service data; equipment id, employee id, date servied
INSERT INTO equipment_service   VALUES(1, 7, '01-DEC-19');
INSERT INTO equipment_service   VALUES(2, 5, '01-DEC-19');
INSERT INTO equipment_service   VALUES(4, 3, '01-JAN-20');
INSERT INTO equipment_service   VALUES(8, 1, '01-JAN-20');
INSERT INTO equipment_service   VALUES(9, 15, '01-JAN-20');
INSERT INTO equipment_service   VALUES(5, 9, '01-JAN-20');
INSERT INTO equipment_service   VALUES (1, 14, '01-FEB-20');
INSERT INTO equipment_service   VALUES (2, 11, '01-FEB-20');

-- restock data; inventory id, employee id, order date, amount ordered, and stock number
INSERT INTO restock     VALUES (1, 1, '01-JAN-20', 500);
INSERT INTO restock     VALUES (2, 1, '01-JAN-20', 500);
INSERT INTO restock     VALUES (3, 5, '15-JAN-20', 500);
INSERT INTO restock     VALUES (4, 4, '20-JAN-20', 500);
INSERT INTO restock     VALUES (5, 4, '20-JAN-20', 500);
INSERT INTO restock     VALUES (6, 4, '20-JAN-20', 500);
INSERT INTO restock     VALUES (7, 4, '20-JAN-20', 500);
INSERT INTO restock     VALUES (8, 4, '20-JAN-20', 500);

-- flavors data; what flavors were sold; sale id and ice creame flavor id
INSERT INTO flavors     VALUES (1, 20);
INSERT INTO flavors     VALUES (2, 7);
INSERT INTO flavors     VALUES (3, 2);
INSERT INTO flavors     VALUES (4, 17);
INSERT INTO flavors     VALUES (5, 19);
INSERT INTO flavors     VALUES (6, 9);
INSERT INTO flavors     VALUES (7, 13);
INSERT INTO flavors     VALUES (8, 6);
INSERT INTO flavors     VALUES (9, 16);
INSERT INTO flavors     VALUES (10, 15);
INSERT INTO flavors     VALUES (11, 2);
INSERT INTO flavors     VALUES (12, 3);
INSERT INTO flavors     VALUES (13, 9);
INSERT INTO flavors     VALUES (14, 5);
INSERT INTO flavors     VALUES (15, 12);

COMMIT;