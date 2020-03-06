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


