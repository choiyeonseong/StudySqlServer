use sqlDB;
go
--exec sp_helpdb;
declare @sql varchar(100);	-- 사이즈를 넣어야함
set @sql = 'select * from userTBL where userid = ''EJW'' ';	-- 홑따옴표 두번쓰면 하나로 인식
exec(@sql);	-- 동적 쿼리 실행할 때는 괄호 중요(저장 프로시저인 경우 괄호 안써도 됨)