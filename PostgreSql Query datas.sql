-- 3rd Highest Salary-------------------
select * from(select *, Dense_Rank() over(order by salary desc) as rnk
			 from salary_table)t
			 where rnk=3
select * from salary_table
update salary_table
set salary= 450
where emp_name= 'Emp 3'
----------Create table Worker---------
CREATE TABLE Worker (
	WORKER_ID INT PRIMARY KEY NOT NULL,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT,
	JOINING_DATE timestamp,
	DEPARTMENT CHAR(25)
)
select * from Worker
---------------Insert data into table Worker-----------
INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20', 'Data Engineer'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11', 'Data Analyst'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20', 'Data Engineer'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20', 'Data Scientist'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11', 'Data Engineer'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11', 'Data Scientist'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20', 'Data Analyst'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11', 'Data Engineer');
--------------------Create table Bonus--------------		
CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT,
	BONUS_DATE Timestamp,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);
select * From Bonus
----------------Insert data into table Bonus-------------
INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');
-------------Create table Title---------------
CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM Timestamp,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
)
select * From Title
---------------Insert data into table Title-------------------
INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');
------------------------------Questions Time-----------------------
-- Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
select first_name as Worker_name from Worker 

-- Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
select upper(first_name) as Worker_name from Worker

-- Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
select distinct DEPARTMENT from Worker

-- Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.
select substring(first_name,1,3) from Worker

-- Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table.
SELECT POSITION( 'a' IN 'Amitabh') AS POSITION_of_a;

-- Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
Select RTRIM(first_name) from Worker;

-- Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
select distinct length(DEPARTMENT) from Worker

-- Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
select Replace(first_name,'a','A') from Worker

-- Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them. 
select Concat(FIRST_NAME,' ',LAST_NAME) as COMPLETE_NAME from Worker

-- Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
select * from Worker
order by FIRST_NAME Asc

-- Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
select * from Worker
order by FIRST_NAME Asc, DEPARTMENT Desc

-- Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
select * from Worker
where First_name in ('Vipul','Satish') 

-- Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Data Scientist”.
Select * from Worker
where DEPARTMENT = 'Data Scientist'
-- Or--------------
Select * from Worker
where DEPARTMENT like 'Data Scientist%'

-- Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
select * from Worker 
where First_name like '%a%'

-- Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
select * from Worker 
where First_name like '%a'

-- Q-18. Write a SQL query to fetch max and min salary of the Worker.
select max(salary) as Maximum_salary, min(salary) as Minimum_salary from Worker

-- Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
select * from Worker
where First_name like '____h';

-- Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
select * from Worker
where salary between 100000 and 500000
-- OR-------------------------
Select FIRST_NAME, LAST_NAME, salary FROM Worker 
WHERE salary BETWEEN 100000 and 500000;

-- Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.
Select * from Worker where year(JOINING_DATE) = 2014 and month(JOINING_DATE) = 2;

-- Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.
select Concat(first_name,' ',Last_name) as Worker_name, salary
from Worker
where Worker_Id in (select Worker_Id from worker 
				   where salary between 50000 and 100000)
-- 	OR-------------------------
Select FIRST_NAME, LAST_NAME, Salary
FROM Worker WHERE WORKER_ID IN 
(SELECT WORKER_ID FROM Worker 
WHERE Salary BETWEEN 50000 AND 100000);

-- Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.
select DEPARTMENT, count(worker_id) as No_of_Workers
from Worker 
Group by DEPARTMENT
order by No_of_Workers Desc

-- 



