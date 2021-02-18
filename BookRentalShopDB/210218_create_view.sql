create or alter view uv_notrentalMember
as
	select r.rentalIdx
      --,r.memberIdx
	  ,m.memberName
	  --,b.cateIdx
	  ,c.cateName
      --,r.bookIdx
	  ,b.bookName
	  ,b.author
      ,format(r.rentalDt, 'yyyy-MM-dd') as �뿩��
      ,format(r.returnDt, 'yyyy-MM-dd') as �ݳ���
      ,dbo.ufn_getState(r.rentalState) as '�뿩����'
  from rentalTBL as r

 right outer join memberTBL as m
	on r.memberIdx = m.memberIdx
 left outer join booksTBL as b
	on r.bookIdx = b.bookIdx
 left outer join categoryTBL as c
	on b.cateIdx = c.cateIdx

 where r.rentalIdx is null;
go