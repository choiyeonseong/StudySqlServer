use sqlDB;
go

create or alter procedure usp_error
	@userId char(8),
	@username nvarchar(10),
	@birthyear int = 1900,
	@addr nchar(2) = '서울',
	@mobile1 char(3) = null,
	@mobile2 char(8) = null,
	@height smallInt = 170,
	@mDate date = '2021-02-15'
as
	declare @err int;
	begin try
		begin tran
			INSERT INTO [dbo].[userTBL]	VALUES
							(@userID, @userName, @birthYear, @addr
							,@mobile1, @mobile2, @height, @mDate);
		commit;
	end try

	begin catch
		select @err = ERROR_NUMBER();
		rollback;
	end catch
	
	if @err != 0
	begin
		print '###' + @userName + '을(를) INSERT에 실패했습니다' + '###';
	end

	print concat('에러번호 : ', @err);	--  오류번호 돌려줌
GO

exec usp_error 'UDT','우당탕',1988,'부산','019','99900224',190,'2021-02-14';

