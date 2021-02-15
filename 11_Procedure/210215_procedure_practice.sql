use sqlDB;
go

create or alter procedure usp_buyproduct
	@userID char(8)
as 
	select num, userid, prodName, (price*amount) as '구매금액'
	from buyTBL
	where userID = @userID;
go

exec usp_buyproduct 'BBK';