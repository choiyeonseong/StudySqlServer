use sqlDB;
go
  
-- �̸��� ���ȣ�� ��� ��ȸ
select * from userTBL 
	where userName='���ȣ';

-- 1970�� ���� ����̰� Ű 182 �̻��� ��� ���̵�, �̸��� ��ȸ
select userID, userName
	from userTBL
	where birthYear >= 1970 
		AND height >= 182;

-- 1970�� ���� ����̰ų� Ű 182 �̻��� ��� ���̵�, �̸��� ��ȸ
select userID, userName
	from userTBL
	where birthYear >= 1970 
		OR height >= 182;

-- Ű�� 180 ~ 183 ������ ����� ��ȸ
select userID, userName, height
	from userTBL
	where height >= 180 
		and height <= 183;
-- between ~ and
select userID, userName, height
	from userTBL
	where height between 180 and 183;

-- ������ �泲, ����, ���
select userID, userName, addr
	from userTBL
	where addr='�泲'
		or addr='����'
		or addr='���';
-- IN()
select userID, userName, addr
	from userTBL
	where addr in('�泲', '����', '���');

-- LIKE
select userID, userName, addr
	from userTBL
	where userName like '��%';	-- ���� ����

select userID, userName, addr
	from userTBL
	where userName like '_����';	-- �� ����

-- SUBQUERY
select userName, height
	from userTBL
	where height > 177;

-- �������������� �ʵ��̸��� �ϳ��� ���� ����, ���� �ϳ��� ��ȯ
select userName, height
	from userTBL
	where height > 
	(	select height from userTBL where userName='���ȣ'	);

select userName, height
	from userTBL
	where height >= ANY	-- ���������� ������ �ϳ��� ����
	(	select height from userTBL where addr='�泲'	);

select userName, height
	from userTBL
	where height >= ALL	-- ���������� ������ ��� ����
	(	select height from userTBL where addr='�泲'	);

select userName, height
	from userTBL
	where height in	-- (== '=any') ���������� ���ǿ� �ش��ϴ� ��
	(	select height from userTBL where addr='�泲'	);

-- ORDER BY ����
select userName, mdate 
	from userTBL
	order by mdate asc;	-- asc ��������, desc ��������

select * 
	from userTBL
	order by userID desc;

-- DISTINCT �ߺ� ����
select DISTINCT addr from userTBL;

select top(5) * 
	from userTBL
	order by mdate desc;

-- offset �ռ� ������ŭ �پ���� �� ��ȸ
select userID, userName, birthYear
	from userTBL
	order by birthYear desc
	offset 4 rows;

-- ������ ���ο� ���̺� ���� 
select * into buytbl2 from buyTBL;
select userID, prodName into buytbl3 from buyTBL;

-- GROUP BY
select userID, amount 
	from buyTBL
	order by userID;

select userID, sum(amount) as '�����հ�'
	from buyTBL
	group by userID;

-- min, max
select min(height) as '�ּ�Ű'
	from userTBL;

select max(height) as '�ִ�Ű'
	from userTBL;

select userid, min(height) as '�ּ�Ű', max(height) as '�ִ�Ű'
	from userTBL
	group by userid;

select userid, username, height
		from usertbl
		where height=(select min(height) from usertbl)
		or height=(select max(height) from usertbl);

-- �� ������ ����
select count(*) as 'ȸ����' from userTBL;
select count(*) as '���ų�����' from buyTBL;