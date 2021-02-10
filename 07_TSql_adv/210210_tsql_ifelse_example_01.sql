declare @var1 int;	-- 변수선언
set @var1=100;	-- 변수 값 대입

if @var1=100
begin
	print '@var1 100임';	--select로 입력하면 가상의 테이블로 출력
end

else
begin
	print '@var1 100이 아님';
end