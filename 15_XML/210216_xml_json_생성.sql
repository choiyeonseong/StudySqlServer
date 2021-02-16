select u.userID, u.userName, u.birthYear, u.addr, u.height, b.prodName, b.price
	from userTBL as u
	inner join buyTBL as b
		on u.userID = b.userID
	where u.height > 170
	for json auto;	-- json 생성
	-- for xml auto	-- xml 생성

	-- 옛날에는 xml 많이 쓰고 지금은 json 많이 씀