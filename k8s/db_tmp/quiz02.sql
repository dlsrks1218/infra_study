DROP DATABASE mydb;
CREATE DATABASE mydb;
USE mydb;

CREATE TABLE Department(
  deptno int not null,
  deptname varchar(20),
  manager varchar(20),
  primary key(deptno)
);

CREATE TABLE Employee(
  empno int not null,
  name varchar(20),
  phoneno int,
  address varchar(20),
  sex varchar(20),
  position varchar(20),
  deptno INT,
  primary key(empno),
  foreign key(deptno) references Department(deptno)
);

CREATE TABLE Project(
  projno int not null,
  projname varchar(20),
  deptno int,
  primary key(projno),
  foreign key(deptno) references Department(deptno)
);

CREATE TABLE Works(
  projno int not null,
  empno int not null,
  hoursworked int,
  PRIMARY key(projno, empno),
  foreign key(projno) references Project(projno),
  foreign key(empno) references Employee(empno)
);

ALTER TABLE Department CONVERT TO character SET utf8;
ALTER TABLE Project CONVERT TO character SET utf8;
ALTER TABLE Works CONVERT TO character SET utf8;
ALTER TABLE Employee CONVERT TO character SET utf8;

insert into Department values(1,'IT', '고남순');
insert into Department values(2,'Marketing', '홍길동');
insert into Employee values(1, '김덕성', 01012341232, '서울','여','Programmer',1);
insert into Employee values(2, '이서울', 01012323122, '서울','남','Programmer',1);
insert into Employee values(3, '박연세', 01076851231, '대전','여','Salesperson',2);
insert into Employee values(4, '홍길동', 01012341546, '서울','남','Manager',2);
insert into Employee values(5, '고남순', 01012311112, '서울','여','Manager',1);
insert into Project values(1,'데이터베이스구축',1);
insert into Project values(2,'시장조사',2);
insert into Works values(1, 1, 3);
insert into Works values(1, 2, 1);
insert into Works values(2, 3, 1);
insert into Works values(2, 4, 5);
insert into Works values(1, 5, 1);