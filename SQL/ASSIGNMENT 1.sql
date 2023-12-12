	

create database assignment;
use assignment;

CREATE TABLE countries (
    name VARCHAR(255),  
    population INT,     
    capital VARCHAR(255) 
);
select * from countries;

INSERT INTO countries (name, population, capital) VALUES
    ('China', 1382, 'Beijing'),
    ('India', 1326, 'Delhi'),
    ('United States', 324, 'Washington D.C.'),
    ('Indonesia', 260, 'Jakarta'),
    ('Brazil', 209, 'Brasilia'),
    ('Pakistan', 193, 'Islamabad'),
    ('Nigeria', 187, 'Abuja'),
    ('Bangladesh', 163, 'Dhaka'),
    ('Russia', 143, 'Moscow'),
    ('Mexico', 128, 'Mexico City'),
    ('Japan', 126, 'Tokyo'),
    ('Philippines', 102, 'Manila'),
    ('Ethiopia', 101, 'Addis Ababa'),
    ('Vietnam', 94, 'Hanoi'),
    ('Egypt', 93, 'Cairo'),
    ('Germany', 81, 'Berlin'),
    ('Iran', 80, 'Tehran'),
    ('Turkey', 79, 'Ankara'),
    ('Congo', 79, 'Kinshasa'),
    ('France', 64, 'Paris'),
    ('United Kingdom', 65, 'London'),
    ('Italy', 60, 'Rome'),
    ('South Africa', 55, 'Pretoria'),
    ('Myanmar', 54, 'Naypyidaw');
    
    
    update countries set capital = 'New Delhi' where name = 'India';
    
RENAME TABLE countries TO big_countries;
select * from big_countries;

CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(255),
    location VARCHAR(255)
);


CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    supplier_id INT,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);

CREATE TABLE Stock (
    id INT PRIMARY KEY,
    product_id INT,
    balance_stock INT,
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

INSERT INTO Suppliers (supplier_id, supplier_name, location)
VALUES
    (1, 'ABC Electronics', 'New York'),
    (2, 'XYZ Manufacturing', 'Los Angeles'),
    (3, 'Globe Imports', 'Chicago'),
    (4, 'Tech Innovators', 'San Francisco'),
    (5, 'Global Suppliers Inc.', 'Houston'),
    (6, 'Quality Goods Ltd.', 'Miami'),
    (7, 'Tech Solutions Corp.', 'Boston'),
    (8, 'Best Products Co.', 'Philadelphia'),
    (9, 'Super Suppliers', 'Dallas'),
    (10, 'Mega Importers', 'Atlanta'),
    (11, 'GlobalTech Suppliers', 'Seattle'),
    (12, 'Sunrise Electronics', 'Denver'),
    (13, 'Advanced Tech Ltd.', 'Phoenix'),
    (14, 'High-Quality Imports', 'Detroit'),
    (15, 'Innovative Supply Chain', 'Minneapolis');
    
    INSERT INTO Product (product_id, product_name, description, supplier_id)
VALUES
    (101, 'Laptop', 'High-performance laptop with SSD', 1),
    (102, 'Smartphone', 'Latest Android smartphone', 2),
    (103, 'Tablet', '10-inch tablet with Retina display', 3),
    (104, 'Smart TV', '55-inch 4K UHD Smart TV', 4),
    (105, 'Digital Camera', '24MP digital camera with zoom lens', 5),
    (106, 'Wireless Headphones', 'Over-ear wireless headphones', 6),
    (107, 'Gaming Console', 'Next-gen gaming console', 7),
    (108, 'Home Security System', 'Smart home security system', 8),
    (109, 'Office Chair', 'Ergonomic office chair', 9),
    (110, 'Refrigerator', 'Energy-efficient refrigerator', 10),
    (111, 'Washing Machine', 'Front-load washing machine', 11),
    (112, 'Coffee Maker', 'Programmable coffee maker', 12),
    (113, 'Fitness Tracker', 'Water-resistant fitness tracker', 13),
    (114, 'Power Drill', 'Cordless power drill with accessories', 14),
    (115, 'Blender', 'High-speed blender for smoothies', 15);
    
    INSERT INTO Stock (id, product_id, balance_stock)
VALUES
    (1001, 101, 50),
    (1002, 102, 75),
    (1003, 103, 60),
    (1004, 104, 40),
    (1005, 105, 25),
    (1006, 106, 70),
    (1007, 107, 55),
    (1008, 108, 30),
    (1009, 109, 45),
    (1010, 110, 80),
    (1011, 111, 65),
    (1012, 112, 20),
    (1013, 113, 75),
    (1014, 114, 90),
    (1015, 115, 50);

ALTER TABLE Suppliers MODIFY COLUMN supplier_name VARCHAR(255) NOT NULL UNIQUE;

drop table EMP;
CREATE TABLE EMP (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    salary DECIMAL(10, 2)
    
);
alter table EMP add column Dept_no int;
select * from EMP;
INSERT INTO EMP (emp_id, first_name, last_name, salary, dept_no)
VALUES
    (1, 'John', 'Doe', 50000.00, 20),
    (2, 'Jane', 'Smith', 60000.00, 30),
    (3, 'Robert', 'Johnson', 55000.00, 40),
    (4, 'Emily', 'Brown', 52000.00, 50),
    (5, 'Michael', 'Lee', 58000.00, 10),
    (6, 'Sarah', 'Wilson', 63000.00, 20),
    (7, 'David', 'Davis', 51000.00, 30),
    (8, 'Jennifer', 'Miller', 54000.00, 40),
    (9, 'William', 'Wilson', 59000.00, 50),
    (10, 'Jessica', 'Anderson', 57000.00, 10);




update emp SET dept_no =
    CASE
        WHEN emp_id % 2 = 0 THEN 20
        WHEN emp_id % 3 = 0 THEN 30
        WHEN emp_id % 4 = 0 THEN 40
        WHEN emp_id % 5 = 0 THEN 50
        ELSE 10
    END;
    
    CREATE UNIQUE INDEX unique_emp_id_index ON emp (emp_id);
    
CREATE VIEW emp_sal AS SELECT emp_id, first_name, last_name, salary FROM emp ORDER BY salary DESC;

select * from emp;