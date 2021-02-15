use sqlDB;
go

create or alter function ufn_getAge
	(@birthyear int)	-- 매개변수를 정수로 받음
	returns int			-- 리턴값은 정수형
as
	begin
		declare @age int;
		set @age = year(GETDATE()) - @birthyear;
		return @age;
	end
go

