USE [sqlDB]
GO

UPDATE [dbo].[userTBL]
   SET [userName] = '������'      
 WHERE userID= 'JKW';
GO

SELECT * FROM backup_userTBL;	-- �ٲ� ���� ����
SELECT * FROM userTBL;			-- �ٲ� �� ����

delete from userTBL
where userID='JKW';