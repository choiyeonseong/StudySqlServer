use tableDB;
go

create table #tempTBL (id int, txt nvarchar(10));
create table ##tempTBL (id int, txt nvarchar(10));
go
insert into #tempTBL values(1,'지역임시테이블');
insert into ##tempTBL values(2,'전역임시테이블');
go

select * from #tempTBL;
select * from ##tempTBL;