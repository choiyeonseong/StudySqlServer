use sqlDB;
go

create or alter procedure usp_ifElse
	@userName nvarchar(10)
as
	declare @birthyear int;	-- ����⵵ ���� ����
	select @birthyear = birthyear 
		from userTBL
		where userName = @userName;

	if(@birthyear >= 1980)
		begin
			print '���� ������';
		end
	else
		begin
			print '���̰� �����ϳ׿�';
		end
go

exec usp_ifElse '�̽±�';