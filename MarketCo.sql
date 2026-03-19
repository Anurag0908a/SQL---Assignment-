create database MarketCo; 

use MarketCo;

create table company(
			company_id int primary key auto_increment,
            company_name varchar(50),
            street varchar(50),
            city varchar(50),
            state varchar(50),
            zip varchar(50));
            
insert into company(company_id, company_name, street, city, state, zip) values
(1, 'Urban Outfitters, Inc.', 'Street 1', 'Philadelphia', 'PA', '19103'),
(2, 'Toll Brothers', 'Street 2', 'Horsham', 'PA', '19044');

-- 1) Statement to create the Contact table  
create table contact(
           contact_id int primary key ,
           company_id int ,
           first_name varchar (50),
           last_name varchar(50),
           street varchar(50),
           city varchar(50),
           state varchar(50),
           zip varchar(50),
           ismain boolean,
           email varchar(50),
           phone varchar(12),
           foreign KEY (company_id) references company(company_id));
           
insert into contact (contact_id, company_id, first_name, last_name, street, city, state, zip, ismain, email, phone) values
(1, 1, 'Dianne', 'Connor', 'Street A', 'CityA', 'PA', '19001', true, 'dianne@mail.com', '111-111-1111'),
(2, 2, 'John', 'Smith', 'Street B', 'CityB', 'PA', '19002', false, 'john@mail.com', '222-222-2222');

-- 2) Statement to create the Employee table
create table employee (
               employee_id int primary key ,
               first_name varchar(50) not null,
			   last_name varchar(50),
               salary decimal(10,2),
               hire_date date,
               job_title varchar(50),
               email varchar(50),
               phone varchar(12));

insert into employee(employee_id, first_name, last_name, salary, hire_date, job_title, email, phone )VALUES
(1, 'Lesley', 'Bland', 60000, '2015-06-01', 'Manager', 'lesley@mail.com', '215-555-1234'),
(2, 'Jack', 'Lee', 50000, '2017-03-15', 'Executive', 'jack@mail.com', '215-555-5678');
               
-- 3) Statement to create the ContactEmployee table  
create table contactemployee( 
                  contactemployee_id int primary key, 
                  contact_id int,
                  employee_id int,
                  contract_date date,
                  description varchar(100),
                  foreign key (contact_id) references contact(contact_id),
				  foreign key (employee_id) references employee(employee_id));

insert into contactemployee(contactemployee_id, contact_id, employee_id, contract_date, description) VALUES
(1, 1, 2, '2023-01-10', 'Meeting with Jack Lee'),
(2, 2, 1, '2023-02-15', 'Project discussion');

-- 4) In the Employee table, the statement that changes Lesley Bland’s phone number to 215-555-8800  

update employee
set phone = "215-555-8800"
where employee_id = 101;

-- 5) In the Company table, the statement that changes the name of “Urban Outfitters, Inc.” to “Urban Outfitters” . 


update company
set company_name = "Urban Outfitters"
where company_name = "Urban Outfitters, Inc.";



-- 6)  In ContactEmployee table, the statement that removes Dianne Connor’s contact event with Jack Lee (one statement). 

  delete ce
from contactemployee ce
join contact c 
on ce.contact_id = c.contact_id
join employee e 
on ce.employee_id = e.employee_id
where c.first_name = "Dianne"
and   c.last_name = "Connor"  -- 5 row delet
and   e.first_name = "Jack" -- 5 row delet
and   e.last_name = "Lee";

-- 7) Write the SQL SELECT query that displays the names of the employees that have contacted Toll Brothers (one statement). Run the SQL SELECT query in MySQL Workbench. Copy the results below as well.  
select distinct e.first_name, e.last_name
from employee e
join contactemployee ce on e.employee_id = ce.employee_id
join contact c on ce.contact_id = c.contact_id
join company co on c.company_id = co.company_id
where co.company_name = 'Toll Brothers';

-- 8) What is the significance of “%” and “_” operators in the LIKE statement?   
-- Like operator is use pattern matching 
--  % - 0,1 unlimited character match 
--  _ - exactly one character match

-- 9) Explain normalization in the context of databases.  
-- it is process of database to properly organize 
-- remove duplicate data 
-- data consistency maintain

-- 10) What does a join in MySQL mean? 
-- join means join multiple tables with using related data combine

--   11) 19.What do you understand about DDL, DCL, and DML in MySQL?  
-- DDL(DATA DEFINATION LANGUAGE):  create & change or delete database structure 

                   -- CREATE, ALTER, DROP, TRUNCATE
                   
-- DML(DATA MANIPULATION LANGUAGE): store and delet data in structure      
                 
                    -- INSERT,UPDATE,DELETE
                    
-- DCL() DATA CONTROLL LANGUAGE): controll,acess,permission in database

                    -- GRANT, REVOKE  
                    
-- 12) What is the role of the MySQL JOIN clause in a query, and what are some common types of joins? 
-- types of joins
-- 1. inner join : matchin records from both tables
-- 2. left join : return all records from left table + match records
-- 3. right join : return all records from right table + match records
-- 4. full join : return all records of table OF RIGHT, LEFT and match data
-- 5. cross join : reurns all possible combination of rows from two tables  