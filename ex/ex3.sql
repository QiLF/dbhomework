use student;
drop table Tpb16000953;
-- 1 创建表 T**
create table Tpb16000953 (
  title     varchar(40),
  author    varchar(20),
  book_id   varchar(20) not null primary key,
  price     float,
  publisher varchar(20),
)
alter table Tpb16000953
  add published_time varchar(20);
-- 向T**插入数据
insert into Tpb16000953 (title, author, book_id, price, publisher, published_time)
values ('计算机原理', '张一平', 'S3092', 20.80, '中国科技大学', '1986');
insert into Tpb16000953 (title, author, book_id, price, publisher, published_time)
values ('C 语言程序设计', '李华', 'H1298', 15.30, '电子工业', '1993');
insert into Tpb16000953 (title, author, book_id, price, publisher, published_time)
values ('数据库原理', '王家树', 'D1007', 22.70, '高等教育', '1987');
insert into Tpb16000953 (title, author, book_id, price, publisher, published_time)
values ('计算机网络', '高明', 'S5690', 18.90, '高等教育', '1993');
insert into Tpb16000953 (title, author, book_id, price, publisher, published_time)
values ('Artificial intelligence', 'P.Winston', 'D2008', 20.50, '电子工业', '1989');
insert into Tpb16000953 (title, author, book_id, price, publisher, published_time)
values ('Expert systems', 'R.Ullman', 'H3067', 17.00, '清华大学', '1994');
insert into Tpb16000953 (title, author, book_id, price, publisher, published_time)
values ('软件工程', '鲁廷璋', 'S2005', 35.00, '中国科技大学', '1995');
insert into Tpb16000953 (title, author, book_id, price, publisher, published_time)
values ('Fortran 程序设计', '顾学峰', 'S5006', 18.00, '高等教育', '1995');

-- 创建表S**
create table Spb16000953 (
  book_id    varchar(20) not null primary key,
  pages_num  int,
  stored_num int,
  store_id   char(2)
)
-- 向S**插入数据
insert into Spb16000953 (book_id, pages_num, stored_num, store_id)
values ('S3092', 304, 300, '1');
insert into Spb16000953 (book_id, pages_num, stored_num, store_id)
values ('D1007', 280, 200, '3');
insert into Spb16000953 (book_id, pages_num, stored_num, store_id)
values ('S5006', 315, 240, '2');
insert into Spb16000953 (book_id, pages_num, stored_num, store_id)
values ('S5690', 300, 300, '2');
insert into Spb16000953 (book_id, pages_num, stored_num, store_id)
values ('H1298', 210, 470, '5');
insert into Spb16000953 (book_id, pages_num, stored_num, store_id)
values ('D2008', 358, 342, '2');
insert into Spb16000953 (book_id, pages_num, stored_num, store_id)
values ('S2005', 298, 200, '2');
insert into Spb16000953 (book_id, pages_num, stored_num, store_id)
values ('H3067', 307, 510, '1');

-- 2 子查询方式建表
select title, price
    into STpb16000953
from Tpb16000953;

-- 3 按书号建立索引
create unique index ITpb16000953
  on Tpb16000953 (book_id);

-- 4 子查询方式建视图
create view VTpb16000953 as
  select T.book_id,
         title,
         author,
         price,
         pages_num,
         publisher,
         published_time,
         stored_num,
         store_id
  from Tpb16000953 T,
       Spb16000953 S
  where T.book_id = S.book_id;

-- 5 删除以ST**命名的表
drop table STpb16000953;

-- 6 删除以VT**命名的视图
drop view VTpb16000953;

-- 7 删除以IT**命名的索引
DROP INDEX ITpb16000953 on Tpb16000953;

-- 8 对表 T** 和 S** 进行其他操作，建其它索引与视图各一个
create unique INDEX Iprice_pb16000953 -- 在T**上建立价格索引
  on Tpb16000953 (price);
create view Vstore_book_pb16000953 as -- 建立仓库存书视图
  select store_id,  title, stored_num
  from Tpb16000953 T,
       Spb16000953 S
  WHERE T.book_id = S.book_id;