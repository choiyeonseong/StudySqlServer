-- ����� ���� �Լ��� ������� ���� ��
select *, year(GETDATE()) - birthYear +1 as ���� from userTBL;

-- ����� ���� �Լ� ���
select *, 
		dbo.ufn_getAge(birthyear) +1 as ����,
		dbo.ufn_getZodiac(birthyear) as ��
	from userTBL; -- ȣ��� ��Ű���� �ٿ�����