use BookRentalShopDB;
go

-- 실제 회원 정보 불러오기 레벨, 이름순
select memberID, memberName, levels, mobile, email
	from memberTBL
	where levels <> 'S'	-- '<>' == '!='
	order by levels desc, memberName asc;

-- 책정보
select cateIdx, bookName, author, interpreter, company, format(price,'#,##')
	from booksTBL
	order by price desc;

select * from categoryTBL;

-- 시스템 함수 사용 쿼리
select	memberID,
		CONCAT(RIGHT(MEMBERNAME,2), ' ', LEFT(MEMBERNAME,1)) AS '미국식 이름',
		CASE levels
			WHEN 'A' THEN '골드회원'
			WHEN 'B' THEN '실버회원'
			WHEN 'C' THEN '브론즈회원'
			WHEN 'D' THEN '철회원'
			WHEN 'S' THEN '관리자'
			ELSE '비회원'
		END AS '회원레벨',
		CONCAT(SUBSTRING(mobile,1,3),'-',SUBSTRING(mobile,4,4),'-',SUBSTRING(mobile,8,4)) AS '전화번호',
		UPPER(email) AS '이메일'
	from memberTBL
	where levels <> 'S'
	order by levels asc, memberName asc;

-- 사용자 정의 함수 사용 쿼리
select	memberID,
		CONCAT(RIGHT(MEMBERNAME,2), ' ', LEFT(MEMBERNAME,1)) AS '미국식 이름',
		dbo.ufn_getLevel(levels) AS '회원레벨', -- 사용자 정의 함수
		CONCAT(SUBSTRING(mobile,1,3),'-',SUBSTRING(mobile,4,4),'-',SUBSTRING(mobile,8,4)) AS '전화번호',
		UPPER(email) AS '이메일'
	from memberTBL
	where levels <> 'S'
	order by levels asc, memberName asc;

-- 책 정보, 시스템 함수, 포맷 함수 쿼리
select bookIdx
      ,cateIdx
      ,concat('책제목 > ', bookName) as bookName
      ,author
      ,isnull(interpreter, '(역자없음)') as '번역가'	-- null값을 다른값으로 변경(ex. price: null -> 0)
      ,company
      ,format(releaseDate, 'yyyy년 MM월 dd일') as '출판일'
      ,format(price,'#,#원') as '가격'
  from booksTBL;