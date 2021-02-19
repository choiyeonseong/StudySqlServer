use bookrentalshop;
go

-- 3-1 다르게 푸는 방법 (1) 
-- inner join 약식
select	b.idx			번호	-- as가 없어도 가능(약식)
		,b.Division		as '장르 번호' -- 띄어쓰기가 없으면 작은따옴표 필요없음
		,d.Names		as 장르
		,b.Names		as 책제목
		,b.Author		as 저자
	from bookstbl  b
		, divtbl  d					-- inner join	-> ,	(inner join을 편하게 쓰기 위한 약식)
	where b.Division = d.Division	-- on			-> where
	and b.Division = 'B002';		-- where		-> and

-- 3-1 다르게 푸는 방법 (2) 
-- subquery(코드가 길면 속도가 느려질 수 있음)
select	b.idx			as 번호
		,b.Division		as 장르번호
		-- ,d.Names		as 장르
		,(select d.Names from divtbl as d where d.Division = b.Division) as 장르
		,b.Names		as 책제목
		,b.Author		as 저자
	from bookstbl as b
  where b.Division = 'B002';

-- 3-2 다르게 푸는 방법
-- subquery (통계낼때 많이 사용)
select	m.Names
		,m.Levels
		,m.Addr
		,(select r.rentalDate from rentaltbl as r where r.memberIdx = m.Idx) as rentalDate
	from membertbl as m
	where m.Idx not in (select memberidx from rentaltbl as r);
		
-- 5 다르게 푸는 방법 (1)
-- subquery
select	(select d.Names from divtbl as d where d.Division=b.Division)			as names
		,sum(Price)		as 총합계금액
	from bookstbl as b
  group by b.Division	-- group by rollup d.Names
  with rollup;

-- 5 다르게 푸는 방법 (2)
select	(select names from divtbl where Division = a.Division) as names
		,a.sum_price
	from (
		select Division, SUM(Price) as sum_price 
			from bookstbl
			group by Division with rollup 
		 )as a	

-- 5 다르게 푸는 방법 (3)
select c.names, sum(c.sum_price) as 총합계금액
	from (
		select	(select names from divtbl where Division = a.Division) as names
				,a.sum_price
		from 
			(select Division, SUM(Price) as sum_price 
				from bookstbl
				group by Division )as a
		) as c
	group by rollup (c.names);
		 
-- 5 다르게 푸는 방법 (4)
-- 테이블과 총합계 테이블을 union
select	(select names from divtbl where Division = a.Division) as names
		,a.sum_price
		from 
			(select Division, SUM(Price) as sum_price 
				from bookstbl
				group by Division )as a
union all
select null, sum(price)
	from bookstbl;