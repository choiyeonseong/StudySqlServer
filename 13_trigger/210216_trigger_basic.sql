use sqlDB;
go

create or alter trigger trg_testtbl
on testtbl
after insert, delete, update -- ����, �����Ҷ� Ʈ���� �߻�
as
	print 'new Ʈ���� �߻�';


insert into testtbl values ('������');

select * from testTBL;

update testTBL set txt = '����ũ' where id=3;

delete testTBL where id=3;
