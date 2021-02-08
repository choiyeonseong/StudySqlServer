use tempdb;
go

create database sqlDB;
go

-- DB생성
use sqlDB;

create table userTBL -- 회원테이블
(
	userID		char(8) not null primary key,	-- 사용자 아이디
	userName	nvarchar(10) not null,			-- 이름
	birthYear	int not null,					-- 출생년도
	addr		nchar(2) not null,				-- 지역
	mobile1		char(3),						-- 전화번호의 국번
	mobile2		char(8),						-- 나머지 전화번호(하이픈- 제외)
	height		smallint,						-- 키
	mDate		date							-- 회원 가입일
);
go

create table buyTBL
(
	num			int identity not null primary key,	-- 순번(pk)
	userID		char(8) not null					-- 사용자 아이디(fk)
			foreign key references userTBL(userID),	
	prodName	nvarchar(20) not null,				-- 물품명
	groupName	nchar(4),							-- 분류
	price		int not null,						-- 단가	
	amount		smallint not null					-- 수량
);
go
