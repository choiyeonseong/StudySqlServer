use BookRentalShopDB;
go

-- outer join - 부모를 기준으로(관계를 제대로 맺었을때)
select r.rentalIdx
      --,r.memberIdx
	  ,m.memberName
	  --,b.cateIdx
	  ,c.cateName
      --,r.bookIdx
	  ,b.bookName
	  ,b.author
      ,format(r.rentalDt, 'yyyy-MM-dd') as 대여일
      ,format(r.returnDt, 'yyyy-MM-dd') as 반납일
      ,dbo.ufn_getState(r.rentalState) as '대여상태'
  from rentalTBL as r
 right outer join memberTBL as m
	on r.memberIdx = m.memberIdx
 left outer join booksTBL as b
	on r.bookIdx = b.bookIdx
 left outer join categoryTBL as c
	on b.cateIdx = c.cateIdx
 where r.rentalIdx is null;

-- 데이터 입력 
insert into booksTBL 
(	
	cateIdx
	,bookName
	,author
	,company
	,releaseDate
	,ISBN
	,price
) 
values 
(	
	'N0002'
	,'순수하지 않은 감각'
	,'요안나'
	,'로코코'
	,'2019-10-02'
	,'9791135445705'
	,12500
);

-- 책테이블 위 책 정보중, 설명, 등록일자 수정
begin tran;	-- 실수할 일을 대비해서, where이 없으면 다시확인

update booksTBL
	set	descriptions = '부명그룹의 브레인이자 핵심 TF팀 리더, 강태욱 수석.
						교육자 부모 아래서 보수적이고 모범적으로 자랐지만,
						원하는 건 무조건 손에 넣어야 하는 집요한 남자.
						그런 그를 자꾸 낯선 충동에 시달리게 하는 여자가 나타났다.
						그녀는 바로 협력사 KJ 신기주 대표의 유능한 비서, 임정은.

						감히 내 옆에 누워서 다른 놈 전화를 받아?
						“이 시간에 어딜 갑니까?”
						“업무상 외출이요.”
						“신기주 대표랑 섹스하러 가는 거냐고 물은 거 아닌데요.”
						그녀가 머리를 올려 묶다 말고 노려보자,
						태욱은 한쪽 입꼬리를 비스듬히 올리며 덧붙였다.
						“임정은 씨, 오늘 새벽부터 일정이 있는 사람이었으면,
						어젯밤에 남자를 방에 불러들이지 말았어야지. 안 그래요?”
						그녀가 한숨을 폭 내쉬며 어깨를 한 번 으쓱하고는 대꾸했다.
						“그 남자가 나한테 미쳐서 밤새 여기 있을 거라고는 예상 못 했거든요.”
						이 요망한 대답을 하는 여자가,
						다시 안고 싶어지는 순간이었다.'
	  , regDate = '2021-02-18'
	where bookIdx = 19;

select * from booksTBL;
rollback;	-- 실수했으면
commit;		-- 성공했으면

-- 카테고리 입력, 삭제
begin tran;

insert into categoryTBL /* (cateIdx, cateName) -- 생략가능 */
	values ('I0001', '자기개발능력'),
		   ('I0002', '성공/처세'),
		   ('I0003', '시간관리');

select * from categoryTBL;
rollback;
commit;

delete from categoryTBL where cateIdx = 'I0003';
delete from categoryTBL where cateIdx in ('I0001','I0002');