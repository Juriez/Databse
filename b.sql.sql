1. 
connect system
2. 
password (that you set when oracle is installed)
3. 
alter user hr identified by "new_password" account unlock;
                 in general new_password = hr
4. 
connect hr
5. 
password (new_password)
6. 
grant dba to hr;
7. 
select * from tab/tabs; 
          * means 'all'
8. 
describe departments; [to describe any table]
9.
select department_id from departments; [to show department_id]
10.
select last_name,department_name from departments;
11.
select salary,12*salary from employees;
           that show the annual salary
12.
select salary, (12*salary+ nvl(12*salary*commission_pct,0)) "Annual Salary with commission";
   nvl(e1,e2) function is used for replacing a number e1 with e2

13.
select last_name ||q'['s annual salary is ]'|| (12*salary+ nvl(12*salary*commission_pct,0)) ;
     || is used for concataned to part

14.
select last_name,department_id,(12*salary+nvl(12*salary*commission_pct,0)) "Annual salary"
FROM 
    employees 
WHERE 
    department_id BETWEEN 10 AND 100 
ORDER BY 
    department_id ASC, (12*salary+nvl(12*salary*commission_pct,0)) DESC; 

15.
select last_name,department_id,(12*salary+nvl(12*salary*commission_pct,0)) "Annual salary"
FROM 
    employees 
WHERE 
    department_id = 80
    AND job_id = 'SA_REP'
    AND (12*salary+nvl(12*salary*commission_pct,0)) >1000
ORDER BY 
    (12*salary+nvl(12*salary*commission_pct,0)) DESC; 

16.
select employee_id,last_name,department_id,(12*salary+nvl(12*salary*commission_pct,0)) "Annual salary"
FROM 
    employees 
WHERE 
    employee_id = &employee_num;

17.
select &e,&l,&d,(12*&&s+nvl(12*&s*commission_pct,0)) "Annual salary"
FROM 
    employees 
WHERE 
    department_id = &d AND (12*&&s+nvl(12*&s*commission_pct,0)) >1000
ORDER BY
    (12*&&s+nvl(12*&s*commission_pct,0)) DESC;

18.
select &name, &j_id,&d_id,&s, 12*salary+12*salary*nvl(commission_pct,0) "Annual"
FROM 
    employees 
WHERE 
    &con1 and &con2 and &con3
ORDER BY
    &odr1,&odr2;

19.
If we want to use notepad/wordpad to write commands instead of write to the terminal, we have to use following rules.

>First of all we should create a folder in any drive. Then a txt file must be created. Then click on 'save as'. At last save that file as a sql file like 'something.sql'.

For example a folder 'Database' is created in 'D' drive. 'a.sql' is a sql file which is created on 'Database'.
Then we write any commands in that file. And if we write the path of that file on terminal then it will run properly.
The command that we have to write on the terminal is...

             @D:\Database\a.sql

Then it will execute the command that we have written in the a.sql file.

  
