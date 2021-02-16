use sqlDB;
go

-- Ŀ�� ����
declare cur_userTBL cursor global	-- global : �������� / local : ��������
	for select userName, height from userTBL;

open cur_userTBL;

-- ���� ����(##���� �ʱ�ȭ##)
declare @username nchar(8);	-- ȸ����
declare @height smallint;	-- ȸ�� Ű
declare @cnt int = 0;			-- ȸ�� ��(���� �� ��) 
declare @totalHeight int = 0;	-- Ű�� �հ�

-- Ŀ�� ���� �о @height ������ �Ҵ�
fetch next from cur_userTBL into @username, @height;

-- �ݺ��� ����
while @@FETCH_STATUS = 0
begin
	set @cnt += 1;
	set @totalHeight += @height;
	print concat('ȸ��: ',@username, 'Ű: ', @height);
	fetch next from cur_userTBL into @username, @height;
end

print @totalheight;
print @cnt;
print concat('ȸ��: ',@username, 'Ű: ', @height);
print concat('ȸ�� Ű ��� => ',@totalHeight / @cnt);

close cur_userTBL;		-- Ŀ�� ����
deallocate cur_userTBL;	-- Ŀ�� �Ҵ� ����