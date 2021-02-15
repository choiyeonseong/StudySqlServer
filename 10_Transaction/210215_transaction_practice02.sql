-- step 0
use sqlDB;
create table bankBook(
	uName nvarchar(10),
	uMoney int
		constraint CK_money
		check (uMoney >= 0)
);
go

insert into bankBook values ('������', 1000);
insert into bankBook values ('�Ǹ���', 0);

-- step 1
update bankBook set uMoney = uMoney - 500 where uName='������';
update bankBook set uMoney = uMoney + 500 where uName='�Ǹ���';

select * from bankBook;

/*
begin tran
	update bankBook set uMoney = uMoney - 500 where uName='������';
commit tran
begin tran
	update bankBook set uMoney = uMoney + 500 where uName='�Ǹ���';
commit tran
*/

-- step 2
update bankBook set uMoney = uMoney - 600 where uName='������';
update bankBook set uMoney = uMoney + 600 where uName='�Ǹ���';

select * from bankBook;

/*
begin tran	-- 1�� Ʈ�����
	update bankBook set uMoney = uMoney - 600 where uName = '������';
	-- ���� �߻�
commit tran
begin tran
	update bankBook set uMoney = uMoney + 600 where uName = '�Ǹ���';
	-- ���� ����
commit tran
*/

-- step 3
update bankBook set uMoney = uMoney - 600 where uName = '�Ǹ���';

/*
begin tran
	update bankBook set uMoney = uMoney - 600 where uName='������';
	update bankBook set uMoney = uMoney + 600 where uName='�Ǹ���';
commit tran
*/

begin try
	begin tran
		update bankBook set uMoney = uMoney - 600 where uName='������';
		-- ù��° update���� ���� �߻�
		update bankBook set uMoney = uMoney + 600 where uName='�Ǹ���';
	commit tran
end try
begin catch
	rollback tran
	-- ������ ��Ƽ� rollback ����
end catch

select * from bankBook;

