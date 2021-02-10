use sqlDB;
go

select	u.userID, 
		u.userName,
		IIF(sum( price * amount ) IS NULL, 0, sum( price * amount )) as 'ÃÑ ±¸¸Å±Ý¾×',
		CASE
			WHEN (sum( price * amount ) >= 1500) THEN 'VVIP'
			WHEN (sum( price * amount ) >= 1000) THEN 'VIP'
			WHEN (sum( price * amount ) >= 1) THEN 'PERSON'
			ELSE 'GHOST'
		END AS '°í°´·¹º§'
	from buyTBL as b
		right outer join userTBL as u 
	on b.userID = u.userID
	group by u.userID, u.userName
	order by sum( price * amount ) desc;