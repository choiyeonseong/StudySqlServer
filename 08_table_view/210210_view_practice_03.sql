use sqlDB;
go

create view uv_buyTBL
as
	select NUM, prodName, groupName from buyTBL where groupName='����';
go

select * from buyTBL;
select * from uv_buyTBL;
insert into uv_buyTBL values ('KKH', '��Ÿ', '�Ǳ�', 4000, 1);

begin tran; -- Ʈ�����

delete from uv_buyTBL;

rollback; -- ������ ����