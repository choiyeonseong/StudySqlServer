-- 테이블이 없어
create view uv_stdclubTBL
as
	select s.id, s.stdName, c.clubName, c.buildingNum
		from stdTbl as s
		inner join clubRegTBL as r
		on s.id=r.std_id
		inner join clubTBL as c
		on r.club_id=c.id;
go

select * from uv_stdclubTBL;