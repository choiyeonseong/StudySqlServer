declare @point int, @credit char;
set @point = 99;	-- 99��

set @credit = 
	CASE
		WHEN (@point >= 90) THEN 'A'
		WHEN (@point >= 80) THEN 'B'
		WHEN (@point >= 70) THEN 'C'
		WHEN (@point >= 60) THEN 'D'
		ELSE 'F'
	END

print concat(N'������� ==> ', @point);	-- N : �����ڵ�
print concat('���� ==> ', @credit)
