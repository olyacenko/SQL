-- Sql DDL PART_1

-- 1)Создать таблицу employees
-- - id. serial,  primary key,
-- - employee_name. Varchar(50), not null

create table employees(
id serial primary key,
employee_name varchar(50) not null
);

-- 2)Наполнить таблицу employee 70 строками.

insert into employees (employee_name)
values('John Smith'),
('Alice Johnson'),
('Michael Williams'),
('Emily Davis'),
('Daniel Anderson'),
('Olivia Martinez'),
('David Taylor'),
('Sophia Wilson'),
('Matthew Thomas'),
('Emma Garcia'),
('Christopher Brown'),
('Ava Jones'),
('Andrew Rodriguez'),
('Isabella Miller'),
('Joshua Davis'),
('Sophia Anderson'),
('Joseph Hernandez'),
('Mia Clark'),
('William Lopez'),
('Abigail Gonzalez'),
('James Lewis'),
('Charlotte Young'),
('Daniel Walker'),
('Harper Hill'),
('Alexander Scott'),
('Ella Green'),
('David Martinez'),
('Victoria Hall'),
('Joseph Wright'),
('Grace Allen'),
('Ethan King'),
('Chloe Baker'),
('Ryan Adams'),
('Scarlett Nelson'),
('Benjamin Rivera'),
('Lily Carter'),
('Samuel Mitchell'),
('Sofia Turner'),
('Jackson Phillips'),
('Avery Torres'),
('Sebastian Hughes'),
('Aria Collins'),
('Jacob Morris'),
('Zoe Ward'),
('Michael Gray'),
('Hannah Murphy'),
('Henry Ramirez'),
('Stella Foster'),
('Carter Morgan'),
('Penelope Butler'),
('Matthew Reed'),
('Layla Simmons'),
('Wyatt Patterson'),
('Nora Bryant'),
('Owen Cox'),
('Evelyn Hayes'),
('Gabriel Barnes'),
('Brooklyn Russell'),
('Luke Coleman'),
('Audrey Saunders'),
('Nathan Howard'),
('Paisley Kim'),
('Isaac Ross'),
('Skylar Long'),
('Henry Powell'),
('Claire Perry'),
('Eli Henderson'),
('Maya Hughes'),
('Jack Wood'),
('Samantha Price');

select * from employees;

-- 3)Создать таблицу salary
-- - id. Serial  primary key,
-- - monthly_salary. Int, not null


create table salary(
id serial primary key,
monthly_salary int not null
);

-- 4) Наполнить таблицу salary 16 строками:

insert into salary(monthly_salary)
values (1000),
(1100),
(1200),
(1300),
(1400),
(1500),
(1600),
(1700),
(1800),
(1900),
(2000),
(2100),
(2200),
(2300),
(2400),
(2500);

select * from salary;

-- 5)Создать таблицу employee_salary
-- - id. Serial  primary key,
-- - employee_id. Int, not null, unique
-- - salary_id. Int, not null

create table employee_salary(
id serial primary key,
employee_id int not null unique,
salary_id int not null
);

-- 6)Наполнить таблицу employee_salary 40 строками:
-- - в 10 строк из 40 вставить несуществующие employee_id

insert into employee_salary(employee_id,salary_id)
values (1,1),
(2,3),
(3,10),
(4,1),
(5,6),
(6,14),
(7,2),
(8,9),
(9,13),
(10,1),
(11,5),
(12,8),
(13,14),
(14,15),
(15,11),
(16,16),
(17,12),
(18,13),
(19,15),
(20,16),
(21,2),
(22,10),
(23,8),
(24,5),
(25,7),
(26,14),
(27,6),
(28,7),
(29,8),
(30,16),
(71,2),
(72,7),
(73,8),
(74,4),
(75,6),
(76,13),
(77,10),
(78,8),
(79,12),
(80,4);

select * from employee_salary;

-- 7) Создать таблицу roles
-- - id. Serial  primary key,
-- - role_name. int, not null, unique

create table roles(
id serial primary key,
role_name int not null unique
);

-- 8) Поменять тип столба role_name с int на varchar(30)
alter table roles
alter column role_name set data type varchar(30);

-- 9) Наполнить таблицу roles 20 строками:

insert into roles(role_name)
values ('Junior Python developer'),
('Middle Python developer'),
('Senior Python developer'),
('Junior Java developer'),
('Middle Java developer'),
('Senior Java developer'),
('Junior JavaScript developer'),
('Middle JavaScript developer'),
('Senior JavaScript developer'),
('Junior Manual QA engineer'),
('Middle Manual QA engineer'),
('Senior Manual QA engineer'),
('Project Manager'),
('Designer'),
('HR'),
('CEO'),
('Sales manager'),
('Junior Automation QA engineer'),
('Middle Automation QA engineer'),
('Senior Automation QA engineer');

select * from roles;

-- 10)Создать таблицу roles_employee
-- - id. Serial  primary key,
-- - employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
-- - role_id. Int, not null (внешний ключ для таблицы roles, поле id)

create table roles_employee(
id serial primary key,
employee_id int not null unique,
role_id int not null,
foreign key (employee_id) references employees(id),
foreign key (role_id) references roles(id)
);

-- 11) Наполнить таблицу roles_employee 40 строками:

insert into roles_employee(employee_id,role_id)
values (1,2),
(2,4),
(3,1),
(4,3),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10),
(11,11),
(12,12),
(13,13),
(14,14),
(15,15),
(16,16),
(17,17),
(18,18),
(19,19),
(20,20),
(30,1),
(40,2),
(50,3),
(60,4),
(70,5),
(41,6),
(56,7),
(61,8),
(33,9),
(43,10),
(38,11),
(68,12),
(51,13),
(34,14),
(37,15),
(63,16),
(54,17),
(39,18),
(47,19),
(42,20);

select * from roles_employee;

-- Sql DML PART_2

-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select employees.id as id_employee, employee_name, monthly_salary, salary.id as id_salary
from employee_salary
join salary on employee_salary.salary_id = salary.id
join employees on employee_salary.employee_id = employees.id;

-- 2. Вывести всех работников у которых ЗП меньше 2000.
select employees.id as id_employee, employee_name, monthly_salary, salary.id as id_salary
from employee_salary
join salary on employee_salary.salary_id = salary.id
join employees on employee_salary.employee_id = employees.id
where monthly_salary < 2000;

-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select salary.id as id_salary, monthly_salary, employee_name, employees.id as id_employee 
from employee_salary
join salary on employee_salary.salary_id = salary.id
left join employees on employee_salary.employee_id = employees.id 
where employee_name is null;

-- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select salary.id as id_salary, monthly_salary, employee_name, employees.id as id_employee
from employee_salary
join salary on employee_salary.salary_id = salary.id
left join employees on employee_salary.employee_id = employees.id
where monthly_salary < 2000 and employee_name is null;

-- 5. Найти всех работников кому не начислена ЗП.
select employees.id as id_employee, employee_name, monthly_salary, salary.id as id_salary
from employee_salary
join salary on employee_salary.salary_id = salary.id
right join employees on employee_salary.employee_id = employees.id 
where monthly_salary is null;

-- 6. Вывести всех работников с названиями их должности.
select employees.id as id_employee, employee_name, role_name, roles.id as id_role
from roles_employee
join employees on roles_employee.employee_id = employees.id 
join roles on roles_employee.role_id = roles.id;

-- 7. Вывести имена и должность только Java разработчиков.
select  employee_name, role_name
from roles_employee
join employees on roles_employee.employee_id = employees.id 
join roles on roles_employee.role_id = roles.id
where role_name like '%Java%';

-- 8. Вывести имена и должность только Python разработчиков.
select employee_name, role_name
from roles_employee
join employees on roles_employee.employee_id = employees.id 
join roles on roles_employee.role_id = roles.id
where role_name like '%Python%';

-- 9. Вывести имена и должность всех QA инженеров.
select employee_name, role_name
from roles_employee
join employees on roles_employee.employee_id = employees.id 
join roles on roles_employee.role_id = roles.id
where role_name like '%QA%';

-- 10. Вывести имена и должность ручных QA инженеров.
select employee_name, role_name
from roles_employee
join employees on roles_employee.employee_id = employees.id 
join roles on roles_employee.role_id = roles.id
where role_name like '%Manual%';

-- 11. Вывести имена и должность автоматизаторов QA
select employee_name, role_name
from roles_employee
join employees on roles_employee.employee_id = employees.id 
join roles on roles_employee.role_id = roles.id
where role_name like '%Automation%';

-- 12. Вывести имена и зарплаты Junior специалистов
select employee_name, monthly_salary, role_name
from roles_employee
join employees on roles_employee.employee_id = employees.id 
join roles on roles_employee.role_id = roles.id
join employee_salary on employees.id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id
where role_name like '%Junior%';

-- 13. Вывести имена и зарплаты Middle специалистов
select employee_name, monthly_salary, role_name
from roles_employee
join employees on roles_employee.employee_id = employees.id 
join roles on roles_employee.role_id = roles.id
join employee_salary on employees.id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id
where role_name like '%Middle%';

-- 14. Вывести имена и зарплаты Senior специалистов
select employee_name, monthly_salary, role_name
from roles_employee
join employees on roles_employee.employee_id = employees.id 
join employee_salary on employee_salary.employee_id = employees.id 
join salary on employee_salary.salary_id = salary.id
join roles on roles_employee.role_id = roles.id
where role_name like '%Senior%';

-- 15. Вывести зарплаты Java разработчиков
select monthly_salary, role_name
from roles_employee
join employee_salary on roles_employee.employee_id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id
join roles on roles_employee.role_id = roles.id
where role_name like '%Java%' and role_name not like '%Script%';

-- 16. Вывести зарплаты Python разработчиков
select monthly_salary, role_name
from roles_employee
join employee_salary on roles_employee.employee_id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id
join roles on roles_employee.role_id = roles.id
where role_name like '%Python%';

-- 17. Вывести имена и зарплаты Junior Python разработчиков
select employee_name, monthly_salary, role_name
from roles_employee
join employees on roles_employee.employee_id = employees.id 
join employee_salary on roles_employee.employee_id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id
join roles on roles_employee.role_id = roles.id
where role_name like '%Junior Python%';
 
-- 18. Вывести имена и зарплаты Middle JS разработчиков
select employee_name, monthly_salary, role_name
from roles_employee 
join employees on roles_employee.employee_id = employees.id 
join employee_salary on roles_employee.employee_id = employee_salary.employee_id 
join salary on employee_salary.salary_id = salary.id 
join roles on roles_employee.role_id = roles.id 
where role_name like '%Middle J___S%';

-- 19. Вывести имена и зарплаты Senior Java разработчиков
select employee_name, monthly_salary, role_name
from roles_employee
join employees on roles_employee.employee_id = employees.id 
join employee_salary on roles_employee.employee_id  = employee_salary.employee_id 
join salary on employee_salary.salary_id = salary.id 
join roles on roles_employee.role_id = roles.id 
where role_name like '%Senior Java%' and role_name not like '%Script%';

-- 20. Вывести зарплаты Junior QA инженеров
select monthly_salary, role_name
from roles_employee
join employee_salary on roles_employee.employee_id = employee_salary.employee_id 
join salary on employee_salary.salary_id  = salary.id 
join roles on roles_employee.role_id = roles.id 
where role_name like '%Junior%' and role_name like '%QA%';

-- 21. Вывести среднюю зарплату всех Junior специалистов
select avg(monthly_salary) as avg_salary_Junior_employees 
from roles_employee
join employee_salary on roles_employee.employee_id = employee_salary.employee_id 
join salary on employee_salary.salary_id = salary.id 
join roles on roles_employee.role_id = roles.id 
where role_name like '%Junior%';

-- 22. Вывести сумму зарплат JS разработчиков
select sum(monthly_salary) as sum_salary_JS_developers
from roles_employee
join employee_salary on roles_employee.employee_id = employee_salary.employee_id 
join salary on employee_salary.salary_id = salary.id 
join roles on roles_employee.role_id = roles.id 
where role_name like '%Script%';

-- 23. Вывести минимальную ЗП QA инженеров
select min(monthly_salary) as min_salary_QA_engineers
from roles_employee
join employee_salary on roles_employee.employee_id = employee_salary.employee_id 
join salary on employee_salary.salary_id = salary.id 
join roles on roles_employee.role_id = roles.id 
where role_name like '%QA%';

-- 24. Вывести максимальную ЗП QA инженеров
select max(monthly_salary) as max_salary_QA_engineers
from roles_employee
join employee_salary on roles_employee.employee_id = employee_salary.employee_id 
join salary on employee_salary.salary_id = salary.id 
join roles on roles_employee.role_id = roles.id 
where role_name like '%QA%';

-- 25. Вывести количество QA инженеров
select count(role_name) as number_QA_engineers
from roles_employee
join employee_salary on roles_employee.employee_id = employee_salary.employee_id 
join salary on employee_salary.salary_id = salary.id 
join roles on roles_employee.role_id = roles.id 
where role_name like '%QA%';

-- 26. Вывести количество Middle специалистов.
select count(role_name) as number_Middle_position
from roles_employee
join employee_salary on roles_employee.employee_id = employee_salary.employee_id 
join salary on employee_salary.salary_id = salary.id 
join roles on roles_employee.role_id = roles.id 
where role_name like '%Middle%';

-- 27. Вывести количество разработчиков
select count(role_name) as number_developers
from roles_employee
join employee_salary on roles_employee.employee_id = employee_salary.employee_id 
join salary on employee_salary.salary_id = salary.id 
join roles on roles_employee.role_id = roles.id 
where role_name like '%developer%';

-- 28. Вывести фонд (сумму) зарплаты разработчиков.
select sum(monthly_salary) as sum_salary_developers
from roles_employee
join employee_salary on roles_employee.employee_id = employee_salary.employee_id 
join salary on employee_salary.salary_id = salary.id 
join roles on roles_employee.role_id = roles.id 
where role_name like '%developer%';

-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select employee_name, role_name, monthly_salary
from roles_employee
join employees on roles_employee.employee_id = employees.id 
join roles on roles_employee.role_id = roles.id 
join employee_salary on roles_employee.employee_id = employee_salary.employee_id 
join salary on employee_salary.salary_id = salary.id
order by monthly_salary ; 

-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select employee_name, role_name, monthly_salary
from roles_employee
join employees on roles_employee.employee_id = employees.id 
join roles on roles_employee.role_id = roles.id 
join employee_salary on roles_employee.employee_id = employee_salary.employee_id 
join salary on employee_salary.salary_id = salary.id
where monthly_salary between 1700 and 2300 order by monthly_salary ;

-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select employee_name, role_name, monthly_salary
from roles_employee
join employees on roles_employee.employee_id = employees.id 
join roles on roles_employee.role_id = roles.id 
join employee_salary on roles_employee.employee_id = employee_salary.employee_id 
join salary on employee_salary.salary_id = salary.id
where monthly_salary < 2300 order by monthly_salary ;

-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select employee_name, role_name, monthly_salary
from roles_employee
join employees on roles_employee.employee_id = employees.id 
join roles on roles_employee.role_id = roles.id 
join employee_salary on roles_employee.employee_id = employee_salary.employee_id 
join salary on employee_salary.salary_id = salary.id
where monthly_salary in (1100, 1500, 2000) order by monthly_salary ;

