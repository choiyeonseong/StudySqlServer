-- 사용자 레벨 리턴 함수
create or alter function ufn_getLevel(@levels char(1))
returns nvarchar(5)
as
begin
	declare @result nvarchar(5);	-- 골드회원, 실버회원, 브론즈회원, 철회원, 관리자 값이 입력되는 변수

	set @result = CASE @levels
					WHEN 'A' THEN '골드회원'
					WHEN 'B' THEN '실버회원'
					WHEN 'C' THEN '브론즈회원'
					WHEN 'D' THEN '철회원'
					WHEN 'S' THEN '관리자'
					ELSE '비회원'
				END;
	return @result;
end
go

-- 다른 select문이랑 같은 쿼리에 있으면 빨간줄