declare @myvalue int;
exec usp_users4 '테스트값 1', @myvalue output;

print concat('현재 입력된 값은 ==> ',@myvalue);
select @myvalue;

exec usp_users '김경호';
exec usp_users2 1980,180;
