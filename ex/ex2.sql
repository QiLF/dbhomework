-- 无条件查询
-- 1
select *
from pubs..authors;
-- 2
select *
from pubs..sales;
-- 3
select *
from pubs..titles;
-- 4
select *
from pubs..employee;
-- 5
select *
from pubs..publishers;

-- 简单条件查询
-- 1
select title, title_id
from pubs..titles;
-- 2
select title
from pubs..titles
where price between 10 and 15;
-- 3
select title_id, title
from pubs..titles
where title like 'T%';
-- 4
select au_id, au_fname, au_lname
from pubs..authors
where city = 'Oakland'; -- 查询Oakland的作者姓名

-- 多条件查询
-- 1
select title, price
from pubs..titles
where title like 'T%'
  and price < 16;
-- 2
select title_id, title, price
from pubs..titles
where title not like 'T%'
  and price > 16;
-- 3
select title_id, ytd_sales
from pubs..titles
where ytd_sales is not null;
-- 4
select pub_name
from pubs..publishers
where country = 'USA'
  and city = 'Boston'; -- 查询美国Boston的出版商名

-- 使用函数查找
-- 1
select count(distinct type) count_type
from pubs..titles;
-- 2
select count(distinct price) count_price
from pubs..titles;
-- 3
select max(price) max_price
from pubs..titles;
-- 4
select sum(ytd_sales) sum_sales
from pubs..titles;
-- 5
select max(price) max_price, min(price) min_price, avg(price) avg_price
from pubs..titles;
-- 6
select pub_id, sum(ytd_sales) sales
from pubs..titles
group by (pub_id);
-- 7
select count(distinct title)
from pubs..titles;
-- 8
select count(*)
from pubs..sales; -- 查询sales表中共有多少条记录

-- 得到排序的查询结果
-- 1
select au_lname, au_fname, phone
from pubs..authors
order by au_lname, au_fname;
-- 2
select title, price
from pubs..titles
order by price desc;
-- 3
select type, avg(price) avg_price
from pubs..titles
where type like '%cook%'
group by type;
-- 4
select lname, fname
from pubs..employee
order by lname, fname desc; -- 查询雇员的姓、名，结果按姓、名字典序降序排列

-- 用嵌套或连接进行查询
-- 1
select pub_name, title
from pubs..publishers,
     pubs..titles
where publishers.pub_id = titles.pub_id
-- 2
select au_lname, au_fname, title
from pubs..authors,
     pubs..titleauthor,
     pubs..titles
where authors.au_id = titleauthor.au_id
  and titleauthor.title_id = titles.title_id;
-- 3
select title, price, qty
from pubs..titles,
     pubs..sales
where qty in (select max(qty) from pubs..sales);
-- 4
select title_id, stor_name
from pubs..sales,
     pubs..stores
where sales.stor_id = stores.stor_id; -- 从sales,stores中查询书号和存储的仓库