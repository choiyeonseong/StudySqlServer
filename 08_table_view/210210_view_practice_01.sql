use sqlDB;
go

create view uv_userTBL
AS 
	select userid, username, addr from userTBL;
go

select * from uv_userTBL;
select * from userTBL;

