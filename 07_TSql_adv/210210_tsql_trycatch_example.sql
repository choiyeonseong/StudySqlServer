begin try
	insert into userTBL values ('LSG','�̻�',1988,'���',NULL,NULL,170,GETDATE());
	print '���� ����';
end try

begin catch
	print '���� ����, �����ڿ��� ���� ���'
end catch