##  in operator
SELECT * FROM employee where Salary in (select Salary from employee where Job= 'Clerk');

SELECT * FROM employee where Salary = (select Salary from employee where Job= 'Clerk'); # gives error

SELECT * FROM employee where Salary = any (select Salary from employee where Job= 'Clerk');

SELECT * FROM employee where Salary < any (select Salary from employee where Salary<20000);

select Salary from employee where Salary<20000;




SELECT *
FROM employee
WHERE Salary > ALL (SELECT 13000 UNION SELECT 7000 UNION SELECT 13000);


## exists operator
select * from employee where exists(select * from employee where eid>5);

