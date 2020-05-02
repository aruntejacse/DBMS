create database student;

use student;

create table faculty(
fid int,
fname varchar(20),
deptid int,
primary key(fid)
);

create table student(
snum int,
sname varchar(20),
major varchar(20),
lvl varchar(5),
age int,
primary key(snum)
);

create table class(
cname varchar(25),
meets_at time,
room varchar(20),
fid int,
primary key(cname),
foreign key(fid) references faculty(fid) on delete cascade
);

create table enrolled(
snum int,
cname varchar(25),
primary key(snum,cname),
foreign key(snum) references student(snum) on delete cascade,
foreign key(cname) references class(cname) on delete cascade 
);

insert into student
values(1,"kenish","major1","jr",20),
(2,"harshavardhan","major2","se",21),
(3,"harshit","major2","so",19),
(4,"khrithik","major3","jr",20),
(5,"aravindh","major2","se",20);

update student
set age=18 where snum=3;

insert into faculty
values(01,"DBMS","111"),
(02,"ADA","222"),
(03,"MATH",333);

insert into class
values("KVN","10:30:00","001",01),
("NAMRATHA","11:30:00","002",02),
("GANESH","12:30:00","003",03);

update class
set room="R128" where cname="NAMRATHA";
insert into enrolled
values(1,"KVN"),
(2,"NAMRATHA"),
(3,"GANESH");

