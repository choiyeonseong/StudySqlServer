insert into xmlTBL values ('HelloWorld');

select * from xmlTBL;

insert into xmlTBL values ('<html><body><p>Sample HTML</p></body></html>');
-- xml은 형식에 까다로움(html 비교적 관대)
insert into xmlTBL values ('<html><body><p>Sample HTML</p></html></body>');