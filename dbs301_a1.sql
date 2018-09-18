/******
Student: Sarah
Class: DBS301S1A- Database Design II and SQL Using Oracle
Assignment: DBS301 Assignement One
Due date: Friday, June 22, 2018.
******/

-- Q1.			***DONE!***
/* PART 1:
-- round(sysdate - hire_date): subtract the current date from when he was hired, results in the number of days he has worked.
-- (10000-(round(sysdate- hire_date))): subtract 10,000 days from the NUMBER OF DAYS WORKED.
-- sysdate(current date) + NUMBER OF DAYS WORKED results in the 10,000th day worked. */
select employee_id, hire_date, to_char(sysdate + (10000-(round(sysdate- hire_date))), 'Month ddth, YYYY') as "10,000th Day" 
from employees
where employee_id = 119

--PART 2:
-- Which day of the week: Friday
-- format the date to 'DAY'
select employee_id, hire_date, to_char(sysdate + (10000-(round(sysdate- hire_date))), 'DAY') as "10,000th Day"
from employees
where employee_id = 119



-- Q2.			***DONE!***
select 'Employee: ' || substr(first_name, 1, 1) || '.' || ' ' || rpad(last_name, 10, '.')  || ' ' || 'Phone: ' || phone_number AS "ONE LINE"
from employees


--Q3.		***DONE!***
SELECT employee_id, first_name, last_name, 
       job_id, department_id, 
       TO_CHAR(salary + (salary * 0.10), 'L9,999,999') "NEW-SALARY", 
       ROUND(commission_pct * 0.35, 2) as "NEW-COMMISSION"
FROM employees
WHERE job_id IN ('SA_REP', 'SA_MAN', 'IT_PROG')
AND
      department_id IN (60, 80);


-- Q4.					***DONE!***
select last_name, ROUND(MONTHS_BETWEEN(SYSDATE, hire_date)/12) years, round(MONTHS_BETWEEN(SYSDATE, hire_date)) months
from employees
order by years desc


-- Q5.					***DONE!***
select distinct department_id, count (*) as employees
from employees
where salary > 2500
having count(*) > 5				--check: reverse to 'less than', 7 departments have less than 5 employees.
group by department_id


-- Q6.
select count(*) total,
sum(decode(to_char(hire_date, 'YYYY'), 2001,1,0))"2001",
sum(decode(to_char(hire_date, 'YYYY'), 2004,1,0))"2004",
sum(decode(to_char(hire_date, 'YYYY'), 2005, 1,0))"2005",
sum(decode(to_char(hire_date, 'YYYY'), 2008, 1,0))"2008"
from employees
