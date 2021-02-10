declare @year int;	-- 년도 변수
set @year = 1980;		-- 값 1980년 대입

if @year >= 1980
begin
	select * from userTBL where birthYear >= @year;
end

else
begin
	print '검색을 할 수 없습니다.';
end