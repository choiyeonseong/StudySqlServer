use sqlDB;
go

create or alter procedure usp_error
	@userId char(8),
	@username nvarchar(10),
	@birthyear int = 1900,
	@addr nchar(2) = '����',
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
		print '###' + @userName + '��(��) INSERT�� �����߽��ϴ�' + '###';
	end

	print concat('������ȣ : ', @err);	--  ������ȣ ������
GO

exec usp_error 'UDT','�����',1988,'�λ�','019','99900224',190,'2021-02-14';
