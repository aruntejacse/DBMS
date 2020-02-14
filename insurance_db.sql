use DB_1BM18CS041; 

 
create table person (
 driver_id varchar(10),
 name varchar(25),
 address varchar(30),
 primary key (driver_id)
 );
 

 create table car (
 reg_num varchar(20),
 model varchar(20),
 year int,
 primary key (reg_num)
 );
 

 create table owns (
 driver_id varchar(10),
 reg_num varchar(20),
 primary key (driver_id,reg_num),
 foreign key (driver_id) references person(driver_id),
 foreign key (reg_num) references car(reg_num)
 );
 
 
create table accident (
 report_num int,
 accident_date varchar(20),
 location varchar(30),
 primary key (report_num)
 );
 
 
create table participated (
 driver_id varchar(10),
 reg_num varchar(20),
 report_num int,
 damage_amount int,
 primary key (driver_id,reg_num,report_num),
 foreign key (driver_id) references person(driver_id),
 foreign key (reg_num) references car(reg_num),
 foreign key (report_num) references accident(report_num)
 );
 show tables;
 
 insert into person
 values('A01','Richard','Srinivasa nagar'),
 ('A02','Pradeep','Rajaji Nagar'),
 ('A03','Smith','Ashok Nagar'),
 ('A04','Venu','N R Colony'),
 ('A05','Jhon','Hanumanth Nagar');
 
insert into car
 values('KA052250','Indica',1990),
 ('KA031181','Lancer',1957),
 ('KA095477','Toyota',1998),
 ('KA053408','Honda',2008),
 ('KA041702','Audi',2005);
 

 insert into owns
 values('A01','KA052250'),
 ('A02','KA031181'),
 ('A03','KA095477'),
 ('A04','KA053408'),
 ('A05','KA041702');
 
insert into accident
 values(11,'01-JAN-03','Mysore Road'),
 (12,'02-FEB-04','Southend Circle'),
 (13,'21-JAN-03','Bull Temple Road'),
 (14,'17-FEB-08','Mysore Road'),
 (15,'04-MAR-05','Kanakapura Road');

insert into participated
 values('A01','KA052250',11,10000),
 ('A02','KA031181',12,50000),
 ('A03','KA095477',13,25000),
 ('A04','KA053408',14,3000),
 ('A05','KA041702',15,5000);
 
 show tables;
select * from person;
select * from car;
select * from owns; 
select * from accident;
select * from participated;

update participated set damage_amount = 25000 where reg_num = 'KA031181' and report_num = 12;
insert into accident 
	values (19,'11-DEC-03','bcder');
select count(distinct driver_id) count from participated, accident where participated.report_num = accident.report_num and accident_date like '%08';
select count(participated.reg_num) count from participated,car,accident where participated.report_num = accident.report_num and car.reg_num = participated.reg_num and model = 'Audi';
 
