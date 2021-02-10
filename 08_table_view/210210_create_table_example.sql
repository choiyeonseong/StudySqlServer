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

create table userTBL			-- ȸ�� ���̺�(�θ�)
(
	userID		char(8)			not null	primary key,	-- ���̵�
	userName	nvarchar(10)	not null,	-- �̸�
	birthYear	int				not null	default year(getdate()),	-- �������
	addr		nchar(2)		not null	default '����',	-- ����
	mobile1		char(3)			null,		-- �޴��� ����
	mobile2		char(8)			null,		-- �޴��� ��ȣ
	height		smallint		null		default 170,		-- Ű
	mDate		date			null,		-- ȸ��������
	email		varchar(150)	not	null	unique	-- �̸��� �߰� 210210 14:25
);
go

create table buyTBL				-- ���� ���̺�(�ڽ�)
(
	num			int				not  null	identity(1,1)	primary key,	-- ����
	userID		char(8)			not null	-- ���̵�
		foreign key references userTBL(userID),	
	prodName	nchar(6)		not null,	-- ��ǰ��
	groupName	nchar(4)		null,		-- �з�
	price		int				not null,	-- �ܰ�
	amount		smallint		not null	-- ����
);
go

--insert into userTBL values('LSG', '�̽±�', 1987,'����','011','1111111',182,'2008-8-8');
--insert into userTBL values('KBS', '�����', 1979,'�泲','011','2222222',173,'2012-4-4');
--insert into userTBL values('KKH', '���ȣ', 1971,'����','019','3333333',177,'2007-7-7');

--insert into buyTBL values('KBS', '�ȭ',	NULL,	30,		2);
--insert into buyTBL values('KBS', '��Ʈ��',	'����',	1000,	1);
--insert into buyTBL values('JYP', '�����',	'����',	200,	1);