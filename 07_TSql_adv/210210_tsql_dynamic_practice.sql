use sqlDB;
go
--exec sp_helpdb;
declare @sql varchar(100);	-- ����� �־����
set @sql = 'select * from userTBL where userid = ''EJW'' ';	-- Ȭ����ǥ �ι����� �ϳ��� �ν�
exec(@sql);	-- ���� ���� ������ ���� ��ȣ �߿�(���� ���ν����� ��� ��ȣ �Ƚᵵ ��)