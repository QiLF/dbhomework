-- 实验四 插入、删除、更新与存储过程
-- PB16000953

-- 1 在 T** 表中插入一元组
insert into Tpb16000953 (title, book_id, price)
values ('Digital Image Processing', 'S7028', 36.00);
-- 2 删除书名为“Fortran 程序设计” 的那个元组
delete from Tpb16000953
where title = 'Fortran 程序设计';
-- 3 删除书号以 H 开头的元组
delete from Tpb16000953
where book_id like 'H%'
-- 4 把书价调整到原来价格的 90 %
update Tpb16000953
set price = price * 0.9
-- 5 把书号以 D 开头的那些书的书价减掉 2.00 元
update Tpb16000953
set price = price - 2.00
where book_id like 'D%'
-- 6 将“计算机原理” 的书号改为 S1135
update Tpb16000953
set book_id = 'S1135'
where title = '计算机原理'
-- 7 对所建的表，进行其他插入、删除、更新操作各一个
insert into Tpb16000953
values ('数据库系统原理教程', '王珊', 'S110', 39.00, '清华大学出版社', '1998.7');

update Tpb16000953
set price = 0
where title = '数据库系统原理教程';

delete from Tpb16000953
where title = '数据库系统原理教程';
-- 8 已知下面百分制成绩和 GPA 绩点、等级成绩之间的关系， 建立名为
-- PB** (即以 PB 开头，后面是建过程人的学号)的存储过程，用于实现对
-- 给定的百分制成绩，输出其 GPA 绩点和等级成绩。 输入参数为百分制成绩，
-- 返回参数为绩点、等级成绩。如输出成绩不在 0~100 直接，存储过程返回
-- -1，否则返回 0。

-- 建表及插入数据
create table PB16000953 (
  grade_start float,
  grade_end   float,
  gpa         float,
  grade_level char(2)
)
insert into PB16000953
VALUES (95, 100, 4.3, 'A+');
insert into PB16000953
VALUES (90, 94, 4.0, 'A');
insert into PB16000953
VALUES (85, 89, 3.7, 'A-');
insert into PB16000953
VALUES (82, 84, 3.3, 'B+');
insert into PB16000953
VALUES (78, 81, 3.0, 'B');
insert into PB16000953
VALUES (75, 77, 2.7, 'B-');
insert into PB16000953
VALUES (72, 74, 2.3, 'C+');
insert into PB16000953
VALUES (68, 71, 2.0, 'C');
insert into PB16000953
VALUES (65, 67, 1.7, 'C-');
insert into PB16000953
VALUES (64, 64, 1.5, 'D+');
insert into PB16000953
VALUES (61, 63, 1.3, 'D');
insert into PB16000953
VALUES (60, 60, 1.0, 'D-');
insert into PB16000953
VALUES (0, 59, 0, 'F');

-- 输入百分制成绩作为参数， 返回GPA及等级成绩
create procedure get_GPA_and_level(
  -- input
  @grade  float,
  -- output
  @status int output,
  @gpa    float output,
  @level  char(2) output
) as
  set @status = -1;
  select @gpa = gpa, @level = grade_level, @status = 0
  from PB16000953
  where grade_start <= @grade and grade_end >= @grade;
go
declare @s int,@g float,@l char(2);
-- set @status = 0;
-- SET @gpa = 4.3;
-- SET @level='A+';
exec get_GPA_and_level  100,@s output ,@g output ,@l output ;
select @s as status,@g as gpa,@l as levelvb;
