-- Task 1

CREATE VIEW vw_employee_details AS
SELECT 
	e.first_name AS fname,
	e.last_name AS lname,
	e.department_id AS dep_id
FROM employees e
JOIN department d ON d.department_id = e.department_id;


SELECT * FROM vw_employee_details;



-- Task 2
INSERT INTO department (dep_name) VALUES
('Lost and Found');


INSERT INTO employees (first_name, last_name, salary, manager_id, department_id) VALUES
('Mohannad','Alfakhory',4000,101,5),
('Raoof','AbdElGhany',4000, 101,5);


CREATE OR REPLACE VIEW vw_employee_details AS
SELECT 
	e.first_name AS fname,
	e.last_name AS lname,
	e.department_id AS dep_id
FROM employees e
JOIN department d ON d.department_id = e.department_id
WHERE d.department_id = 5;

SELECT * FROM vw_employee_details;



-- Task 3
CREATE TABLE suppliers(
	supplier_id SERIAL PRIMARY KEY,
	status INT,
	spplier_name VARCHAR(50) NOT NULL
);


INSERT INTO suppliers (status, spplier_name) VALUES
(10, 'Noor Company'),
(15, 'Hamza Company'),
(16, 'Ramadan Company');


CREATE VIEW vw_high_status_suppliers AS
SELECT * 
FROM suppliers WHERE status > 15
WITH CHECK OPTION;
