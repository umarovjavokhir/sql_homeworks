--Whenever a user enters blank ('', '  ') or null to F(address) it should automatically change it to Tashkent
create database Forlesson4
go
use ForLesson4

create table F(fullname text, address varchar(255) default 'Tashkent')

insert into F values ('Park Ji Sung', 'Seoul')
insert into F values ('Harry Wayne', 'Manchester')
insert into F values ('Lisandro Martinez', '')
insert into F(fullname) values ('Odil Axmedov')

insert into F values ('Andre Berchiche', null)

drop table F
select * from F
exec sp_help f

CREATE TRIGGER after_insert_fullname
AFTER INSERT on f
for each row
BEGIN
    UPDATE F
    SET address = 'Tashkent'
    FROM F
    INNER JOIN inserted i ON F.id = i.id
    WHERE i.address IS NULL OR LTRIM(RTRIM(i.address)) = '';
END;
GO
