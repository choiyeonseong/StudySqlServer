use sqlDB;
go

create or alter procedure usp_ifElse
	@userName nvarchar(10)
as
	declare @birthyear int;	-- 출생년도 저장 변수
	select @birthyear = birthyear 
		from userTBL
		where userName = @userName;

	if(@birthyear >= 1980)
		begin
			print '아직 젊군요';
		end
	else
		begin
			print '나이가 지긋하네요';
		end
go

exec usp_ifElse '이승기';