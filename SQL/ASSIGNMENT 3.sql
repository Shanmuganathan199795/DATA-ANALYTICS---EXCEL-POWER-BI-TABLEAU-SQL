-- 
use assignment;

Select * from orders;
DELIMITER //

CREATE PROCEDURE order_status(IN input_month INT, IN input_year INT)
BEGIN
    SELECT ordernumber, orderdate, status
    FROM orders
    WHERE MONTH(orderdate) = input_month AND YEAR(orderdate) = input_year;
END //

DELIMITER ;

CALL order_status (12, 2003);


-- 2. Write function that takes the customernumber as input and returns the purchase_status based on the following criteria . [table:Payments]
-- if the total purchase amount for the customer is < 25000 status = Silver, amount between 25000 and 50000, status = Gold
-- if amount > 50000 Platinum
select * from payments;
drop function purchase_status;
alter table payments drop column totalAmount;

SELECT customerNumber, SUM(amount) AS totalAmount
FROM payments GROUP BY customerNumber, checkNumber, paymentDate;

DELIMITER //
CREATE FUNCTION purchase_status (customerNumber INT) RETURNS VARCHAR (200)
DETERMINISTIC
BEGIN 
DECLARE total_amount decimal (20,2);

SELECT SUM(amount) INTO total_amount
    FROM payments
    WHERE customerNumber = customerNumber;
    
    IF total_amount < 25000 THEN
        RETURN 'Silver';
    ELSEIF total_amount >= 25000 AND total_amount <= 50000 THEN
        RETURN 'Gold';
    ELSE
        RETURN 'Platinum';
    END IF;
END //


SELECT purchase_status(123) AS customer_purchase_status;

-- b. Write a query that displays customerNumber, customername and purchase_status from customers table.
        
SELECT 
    customerNumber,
    customerName,
    purchase_status(customerNumber) AS purchase_status
FROM 
    customers;

-- 3. Replicate the functionality of 'on delete cascade' and 'on update cascade' using triggers on movies and rentals tables. Note: Both tables - movies and rentals - don't have primary or foreign keys. Use only triggers to implement the above.

select * from movies;
-- Trigger to replicate ON DELETE CASCADE on movies table
DELIMITER //

CREATE TRIGGER delete_movie_cascade
BEFORE DELETE ON movies
FOR EACH ROW
BEGIN
    -- Delete corresponding rentals when a movie is deleted
    DELETE FROM rentals WHERE id = OLD.id;
END;

//

-- Trigger to replicate ON UPDATE CASCADE on movies table
CREATE TRIGGER update_movie_cascade
AFTER UPDATE ON movies
FOR EACH ROW
BEGIN
    -- Update corresponding rentals when a movie_id is updated
    UPDATE rentals SET id = NEW.id WHERE id = OLD.id;
END;
//
DELIMITER ;


-- 4. Select the first name of the employee who gets the third highest salary. [table: employee]
select * from emp;
select emp_no, first_name, last_name
FROM emp
ORDER BY salary DESC
LIMIT 1 OFFSET 2;

-- 5. Assign a rank to each employee  based on their salary. The person having the highest salary has rank 1. [table: employee]
select * from emp;
SELECT
    emp_no,
    first_name,
    last_name,
    salary,
    RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM
    emp;
