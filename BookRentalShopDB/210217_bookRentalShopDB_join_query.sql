use BookRentalShopDB;
go

-- 책정보 조인
SELECT b.bookIdx
      --,b.cateIdx
	  ,c.cateName
      ,b.bookName
      ,b.author
      ,b.interpreter
      ,b.company
  FROM booksTBL as b
  inner join categoryTBL as c
  on b.cateIdx = c.cateIdx;

-- 대여된 책의 정보 쿼리 조인
SELECT r.rentalIdx
      --,r.memberIdx
	  ,m.memberName
	  --,b.bookIdx
      ,b.bookName
	  ,b.author
      ,format(r.rentalDt, 'yyyy-MM-dd') as '대여일'
      ,format(r.returnDt, 'yyyy-MM-dd') as '반납일'
      ,dbo.ufn_getState(r.rentalState) as '대여상태'
  FROM rentalTBL as r
  inner join booksTBL as b
	on r.bookIdx = b.bookIdx
  inner join memberTBL as m
	on r.memberIdx = m.memberIdx;

-- 책을 안빌린 회원 조회
SELECT r.rentalIdx
      --,r.memberIdx
	  ,m.memberName
	  --,b.bookIdx
      ,b.bookName
	  ,b.author
      ,format(r.rentalDt, 'yyyy-MM-dd') as '대여일'
      ,dbo.ufn_getState(r.rentalState) as '대여상태'
  FROM rentalTBL as r
  right outer join booksTBL as b	--  기준이 되는 테이블이 왼쪽이 되어야한다, 헷갈리면 left, right는 돌려보고 결정
	on r.bookIdx = b.bookIdx
  right outer join memberTBL as m
	on r.memberIdx = m.memberIdx
	where r.rentalIdx is null;