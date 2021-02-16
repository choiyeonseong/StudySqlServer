USE [sqlDB]
GO

UPDATE [dbo].[userTBL]
   SET [userName] = '관운장'      
 WHERE userID= 'JKW';
GO

SELECT * FROM backup_userTBL;	-- 바꾼 원본 저장
SELECT * FROM userTBL;			-- 바꾼 값 저장

delete from userTBL
where userID='JKW';