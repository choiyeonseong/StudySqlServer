use sqlDB;
go

create or alter trigger trg_testtbl
on testtbl
after insert, delete, update -- 삭제, 수정할때 트리거 발생
as
	print 'new 트리거 발생';


insert into testtbl values ('마마무');

select * from testTBL;

update testTBL set txt = '블랙핑크' where id=3;

delete testTBL where id=3;
