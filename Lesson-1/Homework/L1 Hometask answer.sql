--You will create a database first
--Create 10 tables in it
--Create a user for this database and grant only select and update commands for this user
--for random 5 tables

create database ForLesson1

create table Table1(col1 int, col2 varchar(max))
create table Table2(col1 int, col2 varchar(max))
create table Table3(col1 int, col2 varchar(max))
create table Table4(col1 int, col2 varchar(max))
create table Table5(col1 int, col2 varchar(max))
create table Table6(col1 int, col2 varchar(max))
create table Table7(col1 int, col2 varchar(max))
create table Table8(col1 int, col2 varchar(max))
create table Table9(col1 int, col2 varchar(max))
create table Table10(col1 int, col2 varchar(max))

create login FirstLogin1 with password = 'Password'

create user User1 for login FirstLogin1

create role UserRole
alter role UserRole add member User1

grant select on Table1 to UserRole
grant update on Table1 to UserRole

grant select on Table3 to UserRole
grant update on Table3 to UserRole

grant select on Table5 to UserRole
grant update on Table5 to UserRole

grant select on Table7 to UserRole
grant update on Table7 to UserRole

grant select on Table9 to UserRole
grant update on Table9 to UserRole



select * from Table1
select * from Table3
select * from Table5
select * from Table7
select * from Table9

