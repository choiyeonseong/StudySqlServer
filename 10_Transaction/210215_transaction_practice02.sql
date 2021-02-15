-- step 0
use sqlDB;
create table bankBook(
	uName nvarchar(10),
	uMoney int
		constraint CK_money
		check (uMoney >= 0)
);
go

insert into bankBook values ('구매자', 1000);
insert into bankBook values ('판매자', 0);

-- step 1
update bankBook set uMoney = uMoney - 500 where uName='구매자';
update bankBook set uMoney = uMoney + 500 where uName='판매자';

select * from bankBook;

/*
begin tran
	update bankBook set uMoney = uMoney - 500 where uName='구매자';
commit tran
begin tran
	update bankBook set uMoney = uMoney + 500 where uName='판매자';
commit tran
*/

-- step 2
update bankBook set uMoney = uMoney - 600 where uName='구매자';
update bankBook set uMoney = uMoney + 600 where uName='판매자';

select * from bankBook;

/*
begin tran	-- 1번 트랜잭션
	update bankBook set uMoney = uMoney - 600 where uName = '구매자';
	-- 오류 발생
commit tran
begin tran
	update bankBook set uMoney = uMoney + 600 where uName = '판매자';
	-- 정상 수행
commit tran
*/

-- step 3
update bankBook set uMoney = uMoney - 600 where uName = '판매자';

/*
begin tran
	update bankBook set uMoney = uMoney - 600 where uName='구매자';
	update bankBook set uMoney = uMoney + 600 where uName='판매자';
commit tran
*/

begin try
	begin tran
		update bankBook set uMoney = uMoney - 600 where uName='구매자';
		-- 첫번째 update에서 오류 발생
		update bankBook set uMoney = uMoney + 600 where uName='판매자';
	commit tran
end try
begin catch
	rollback tran
	-- 오류를 잡아서 rollback 실행
end catch

select * from bankBook;

