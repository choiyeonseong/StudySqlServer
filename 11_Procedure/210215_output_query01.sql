declare @myvalue int;
exec usp_users4 '�׽�Ʈ�� 1', @myvalue output;

print concat('���� �Էµ� ���� ==> ',@myvalue);
select @myvalue;

exec usp_users '���ȣ';
exec usp_users2 1980,180;