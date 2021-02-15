-- 사용자 정의 함수를 사용하지 않은 것
select *, year(GETDATE()) - birthYear +1 as 나이 from userTBL;

-- 사용자 정의 함수 사용
select *, 
		dbo.ufn_getAge(birthyear) +1 as 나이,
		dbo.ufn_getZodiac(birthyear) as 띠
	from userTBL; -- 호출시 스키마명 붙여야함