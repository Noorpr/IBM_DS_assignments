CREATE TABLE employees(
	emp_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	salary NUMERIC(10,2) NOT NULL,
	manager_id INT,
	department_id INT
);

INSERT INTO employees (first_name,last_name, salary, manager_id,department_id) VALUES
('Tariq','Mohammed', 7500, 102,1),
('Mohammed','Fathi',4600, 111,1),
('Ramadan','Shokry',9000,101,2),
('Saleh','Elminshawy',6700,103,3),
('Khaled','Ghandor',8000,104,2),
('Jamal','Hassan',3200,200,2),
('Bilal','Ahmed',12000,100,1),
('Dawood','AbdoAllah',6000,100,3),
('Ibrahim','Tariq',7400,102,1);


INSERT INTO employees (first_name,last_name, salary, manager_id,department_id) VALUES
('Hamza', 'Tawfiq',2500, 102,4),
('Yassir','Nazmi',3500, 106,4),
('Raimz','Elshazly',4000, 103,4),
('Kareem','Ahmed',2800, 105,3),
('Omar','Hazem',5000, 102,4);

-- Task 1
SELECT 
	emp_id,
	last_name,
	salary
FROM employees
WHERE salary BETWEEN 2000 AND 5000
AND employees.manager_id NOT IN (101,200);



CREATE TABLE department(
	department_id SERIAL PRIMARY KEY,
	dep_name VARCHAR(40) NOT NULL
);

INSERT INTO department (dep_name) VALUES
('Human Resources'),
('Marketing'),
('Engineering'),
('Finance');


-- Task 2
SELECT 
	e.first_name AS first_name,
	d.dep_name AS department_name
FROM employees e
JOIN department d ON e.department_id = d.department_id
ORDER BY d.dep_name;


-- Task 3
SELECT 
	department_id,
	COUNT(emp_id) AS num_of_employees,
	AVG(salary) AS average_salary
FROM employees
GROUP BY department_id;




