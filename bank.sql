create database bank;

use bank;

create table branch(
	branch_name varchar(30),
    branch_city varchar(20),
    assets int,
    primary key(branch_name)
    );

create table bankaccount(
	accno int,
    branch_name varchar(30),
    balance int,
    primary key(accno),
    foreign key(branch_name) references branch(branch_name)
    );
    
create table bankcustomer(
	customer_name varchar(20),
    customer_street varchar(30),
    customer_city varchar(20),
    primary key(customer_name,customer_street,customer_city)
    );

create table depositor(
	customer_name varchar(20),
    accno int,
    primary key(customer_name,accno),
    foreign key(customer_name) references bankcustomer(customer_name),
    foreign key(accno) references bankaccount(accno)
    );
    
create table loan(
	loan_number int,
    branch_name varchar(30),
    amount int,
    primary key(loan_number),
    foreign key(branch_name) references branch(branch_name)
    );
    
insert into branch
values('SBI_Chamrajpet','Bangalore',50000),
('SBI_ResidencyRoad','Bangalore',10000),
('SBI_ShivajiRoad','Bombay',20000),
('SBI_PaliamentRoad','Delhi',10000),
('SBI_Jantarmantar','Delhi',20000);

insert into bankaccount
values(1,'SBI_Chamrajpet',2000),
(2,'SBI_ResidencyRoad',5000),
(3,'SBI_ShivajiRoad',6000),
(4,'SBI_PaliamentRoad',9000),
(5,'SBI_Jantarmantar',8000),
(6,'SBI_ShivajiRoad',4000),
(8,'SBI_ResidencyRoad',4000),
(9,'SBI_PaliamentRoad',3000),
(10,'SBI_ResidencyRoad',5000),
(11,'SBI_Jantarmantar',2000);

insert into bankcustomer
values('Avinash','Bull_Temple_Road','Bangalore'),
('Dinesh','Bannergatta_Road','Bangalore'),
('Mohan','NationalCollege_Road','Bangalore'),
('Nikil','Akbar_Road','Delhi'),
('Ravi','Prithviraj_Road','Delhi');

insert into depositor
values('Avinash',1),
('Dinesh',2),
('Nikil',4),
('Ravi',5),
('Avinash',8),
('Nikil',9),
('Dinesh',10),
('Nikil',11);

insert into loan
values(1,'SBI_Chamrajpet',1000),
(2,'SBI_ResidencyRoad',2000),
(3,'SBI_ShivajiRoad',3000),
(4,'SBI_PaliamentRoad',4000),
(5,'SBI_Jantarmantar',5000);

select * from branch;
select * from bankaccount;
select * from bankcustomer; 
select * from depositor;
select * from loan;
