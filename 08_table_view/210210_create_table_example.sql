--use sqlDB;
--go
--create table testTBL (num int);
--drop table testTBL;
--use tempdb;
--go
--drop database tableDB;
--go
--create database tableDB;
use tableDB;
go

drop table buyTBL;
drop table userTBL;
go

create table userTBL			-- 회원 테이블(부모)
(
	userID		char(8)			not null	primary key,	-- 아이디
	userName	nvarchar(10)	not null,	-- 이름
	birthYear	int				not null	default year(getdate()),	-- 출생연도
	addr		nchar(2)		not null	default '서울',	-- 지역
	mobile1		char(3)			null,		-- 휴대폰 국번
	mobile2		char(8)			null,		-- 휴대폰 번호
	height		smallint		null		default 170,		-- 키
	mDate		date			null,		-- 회원가입일
	email		varchar(150)	not	null	unique	-- 이메일 추가 210210 14:25
);
go

create table buyTBL				-- 구매 테이블(자식)
(
	num			int				not  null	identity(1,1)	primary key,	-- 순번
	userID		char(8)			not null	-- 아이디
		foreign key references userTBL(userID),	
	prodName	nchar(6)		not null,	-- 물품명
	groupName	nchar(4)		null,		-- 분류
	price		int				not null,	-- 단가
	amount		smallint		not null	-- 수량
);
go

--insert into userTBL values('LSG', '이승기', 1987,'서울','011','1111111',182,'2008-8-8');
--insert into userTBL values('KBS', '김범수', 1979,'경남','011','2222222',173,'2012-4-4');
--insert into userTBL values('KKH', '김경호', 1971,'전남','019','3333333',177,'2007-7-7');

--insert into buyTBL values('KBS', '운동화',	NULL,	30,		2);
--insert into buyTBL values('KBS', '노트북',	'전자',	1000,	1);
--insert into buyTBL values('JYP', '모니터',	'전자',	200,	1);