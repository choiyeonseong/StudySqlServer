use sqlDB;
go

create view uv_buyTBL
as
	select NUM, prodName, groupName from buyTBL where groupName='전자';
go

select * from buyTBL;
select * from uv_buyTBL;
insert into uv_buyTBL values ('KKH', '기타', '악기', 4000, 1);

begin tran; -- 트랜잭션

delete from uv_buyTBL;

rollback; -- 원상태 복귀