use sqlDB;
go

create or alter function ufn_getAge
	(@birthyear int)	-- �Ű������� ������ ����
	returns int			-- ���ϰ��� ������
as
	begin
		declare @age int;
		set @age = year(GETDATE()) - @birthyear;
		return @age;
	end
go

