use sqlDB;
go

-- 커서 선언
declare cur_userTBL cursor global	-- global : 전역변수 / local : 지역변수
	for select userName, height from userTBL;

open cur_userTBL;

-- 변수 선언(##변수 초기화##)
declare @username nchar(8);	-- 회원명
declare @height smallint;	-- 회원 키
declare @cnt int = 0;			-- 회원 수(읽은 행 수) 
declare @totalHeight int = 0;	-- 키의 합계

-- 커서 값을 읽어서 @height 변수에 할당
fetch next from cur_userTBL into @username, @height;

-- 반복문 시작
while @@FETCH_STATUS = 0
begin
	set @cnt += 1;
	set @totalHeight += @height;
	print concat('회원: ',@username, '키: ', @height);
	fetch next from cur_userTBL into @username, @height;
end

print @totalheight;
print @cnt;
print concat('회원: ',@username, '키: ', @height);
print concat('회원 키 평균 => ',@totalHeight / @cnt);

close cur_userTBL;		-- 커서 닫음
deallocate cur_userTBL;	-- 커서 할당 해제