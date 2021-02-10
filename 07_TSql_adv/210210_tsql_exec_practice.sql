declare @curDate date;
declare @curYear varchar(4);
declare @curMonth varchar(2);
declare @curDay varchar(2);
declare @sql varchar(2000);

set @curDate = getDate();
set @curYear = year(@curDate);
set @curMonth = month(@curDate);
set @curDay = day(@curDate);

print @curYear;
--print replicate('0',2 - len(@curMonth)) + @curMonth;
print right(('00' + @curMonth), 2);
print @curDay;

print format(@curDate, 'yyyy_MM_dd');	-- 제일 쉬운 방법

set @sql = 'create table backup_' + format(@curDate, 'yyyy_MM_dd');	-- 테이블 이름에 '-'이 안 들어감
set @sql += '(id int not null primary key, bName nvarchar(100) not null);';
print(@sql);
exec(@sql)