USE [sqlDB]
GO

BEGIN TRY
	BEGIN TRAN;

	INSERT INTO [dbo].[userTBL]
			   ([userID]
			   ,[userName]
			   ,[birthYear]
			   ,[addr]
			   ,[mobile1]
			   ,[mobile2]
			   ,[height]
			   ,[mDate])
		 VALUES
			   ('GJY'
			   ,'������'
			   ,1988
			   ,'����'
			   ,'010'
			   ,'98989898'
			   ,175
			   ,getdate());

	INSERT INTO [dbo].[buyTBL]
			   ([userID]
			   ,[prodName]
			   ,[groupName]
			   ,[price]
			   ,[amount])
		 VALUES
			   ('GJY'
			   ,'���۶�'
			   ,null
			   ,80000000
			   ,1);
	COMMIT
END TRY
BEGIN CATCH
	ROLLBACK
END CATCH
GO



