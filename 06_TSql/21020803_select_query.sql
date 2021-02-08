use sqlDB;
go
  
-- 이름이 김경호인 사람 조회
select * from userTBL 
	where userName='김경호';

-- 1970년 이후 출생이고 키 182 이상인 사람 아이디, 이름만 조회
select userID, userName
	from userTBL
	where birthYear >= 1970 
		AND height >= 182;

-- 1970년 이후 출생이거나 키 182 이상인 사람 아이디, 이름만 조회
select userID, userName
	from userTBL
	where birthYear >= 1970 
		OR height >= 182;

-- 키가 180 ~ 183 사이인 사람만 조회
select userID, userName, height
	from userTBL
	where height >= 180 
		and height <= 183;
-- between ~ and
select userID, userName, height
	from userTBL
	where height between 180 and 183;

-- 지역이 경남, 전남, 경북
select userID, userName, addr
	from userTBL
	where addr='경남'
		or addr='전남'
		or addr='경북';
-- IN()
select userID, userName, addr
	from userTBL
	where addr in('경남', '전남', '경북');

-- LIKE
select userID, userName, addr
	from userTBL
	where userName like '김%';	-- 여러 글자

select userID, userName, addr
	from userTBL
	where userName like '_종신';	-- 한 글자

-- SUBQUERY
select userName, height
	from userTBL
	where height > 177;

-- 서브쿼리에서는 필드이름을 하나만 지정 가능, 값도 하나만 반환
select userName, height
	from userTBL
	where height > 
	(	select height from userTBL where userName='김경호'	);

select userName, height
	from userTBL
	where height >= ANY	-- 서브쿼리의 조건중 하나라도 만족
	(	select height from userTBL where addr='경남'	);

select userName, height
	from userTBL
	where height >= ALL	-- 서브쿼리의 조건을 모두 만족
	(	select height from userTBL where addr='경남'	);

select userName, height
	from userTBL
	where height in	-- (== '=any') 서브쿼리의 조건에 해당하는 값
	(	select height from userTBL where addr='경남'	);

-- ORDER BY 정렬
select userName, mdate 
	from userTBL
	order by mdate asc;	-- asc 오름차순, desc 내림차순

select * 
	from userTBL
	order by userID desc;

-- DISTINCT 중복 제거
select DISTINCT addr from userTBL;

select top(5) * 
	from userTBL
	order by mdate desc;

-- offset 앞선 갯수만큼 뛰어넘은 후 조회
select userID, userName, birthYear
	from userTBL
	order by birthYear desc
	offset 4 rows;

-- 무조건 새로운 테이블에 복사 
select * into buytbl2 from buyTBL;
select userID, prodName into buytbl3 from buyTBL;

-- GROUP BY
select userID, amount 
	from buyTBL
	order by userID;

select userID, sum(amount) as '구매합계'
	from buyTBL
	group by userID;

-- min, max
select min(height) as '최소키'
	from userTBL;

select max(height) as '최대키'
	from userTBL;

select userid, min(height) as '최소키', max(height) as '최대키'
	from userTBL
	group by userid;

select userid, username, height
		from usertbl
		where height=(select min(height) from usertbl)
		or height=(select max(height) from usertbl);

-- 총 데이터 개수
select count(*) as '회원수' from userTBL;
select count(*) as '구매내역수' from buyTBL;