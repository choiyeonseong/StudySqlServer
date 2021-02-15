use sqlDB;
go

create or alter proc usp_return
	@userName nvarchar(10)
as
	declare @userId char(8);
	select @userId = userid from userTBL
			where userName = @userName;

	if(@userId <> '') return 1;	-- inline if
	else return 0;
go

declare @retVal int;
exec @retVal = usp_return 'ÀºÀÚ¿ø';
print @retVal;