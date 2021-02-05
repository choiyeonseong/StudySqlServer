/*
select memberID, memberName
	from memberTbl
	where memberID like 'H%';

select '1'; */

use BikeStores;

select * from sales.customers;

SELECT * FROM production.products;

-- DB조회
EXEC sp_helpdb;

-- 테이블 조회
EXEC sp_tables @TABLE_TYPE="'TABLE'";

-- 열이름 조회
EXEC sp_columns @TABLE_NAME='STOCKS',
				@TABLE_OWNER='PRODUCTION';