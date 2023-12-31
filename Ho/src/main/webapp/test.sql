drop table member_tbl_02;
create table member_tbl_02(
			custno number(6) primary key,
			custname varchar2(20),
			phone varchar2(13),
			address varchar2(60),
			joindate date,
			grade char(1),
			city char(2)
							);
							
insert into member_tbl_02 values(10001, '김행복', '010-1111-2222', '서울 동대문구 휘경1동', '20151202', 'A', '01');
insert into member_tbl_02 values(10002, '이축복', '010-1111-3333', '서울 동대문구 휘경2동', '20151206', 'B', '01');
insert into member_tbl_02 values(10003, '장믿음', '010-1111-4444', '울릉군 울릉읍 독도1리', '20151001', 'B', '30');
insert into member_tbl_02 values(10004, '최사랑', '010-1111-5555', '울릉군 울릉읍 독도2리', '20151113', 'A', '30');
insert into member_tbl_02 values(10005, '진평화', '010-1111-6666', '제주도 제주시 외나무골', '20151225', 'B', '60');
insert into member_tbl_02 values(10006, '차공단', '010-1111-7777', '제주도 제주시 감나무골', '20151211', 'C', '60');
				
select * from member_tbl_02;

drop table money_tbl_02;
create table money_tbl_02(
			custno number(6),
			salenol number(8),
			pcost number(8),
			amount number(4),
			price number(8),
			pcode varchar2(4),
			sdate date,
			primary key(custno, salenol)
							);

select * from money_tbl_02;
delete from member_tbl_02 where custno = 10008;
delete from member_tbl_02 where custno = 10009;
delete from member_tbl_02 where custno = 10010;
delete from member_tbl_02 where custno = 10011;

insert into MONEY_TBL_02 values(10001,20160001,500,5,2500,'A001','20160101');
insert into MONEY_TBL_02 values(10001,20160002,1000,4,4000,'A002','20160101');
insert into MONEY_TBL_02 values(10001,20160003,500,3,1500,'A008','20160101');
insert into MONEY_TBL_02 values(10002,20160004,2000,1,2000,'A004','20160102');
insert into MONEY_TBL_02 values(10002,20160005,500,1,500,'A001','20160103');
insert into MONEY_TBL_02 values(10003,20160006,1500,2,3000,'A003','20160103');
insert into MONEY_TBL_02 values(10004,20160007,500,2,1000,'A001','20160104');
insert into MONEY_TBL_02 values(10004,20160008,300,1,300,'A005','20160104');
insert into MONEY_TBL_02 values(10004,20160009,600,1,600,'A006','20160104');
insert into MONEY_TBL_02 values(10004,20160010,3000,1,3000,'A007','20160106');

select custno, custname, phone, address, to_char(joindate, 'yyyy-mm-dd') as joindate,
case when grade = 'A' then 'VIP' when grade = 'B' then '일반' else '직원' end as grade,
city from member_tbl_02
where custno=10001
 order by custno;
 

 
select a.custno, a.custname, 
case when grade = 'A' then 'VIP' when grade = 'B' then '일반' else '직원' end as grade,
sum(b.price)
from member_tbl_02 a, money_tbl_02 b
where a.custno = b.custno and b.price is not null
group by a.custno, a.custname, a.grade
order by sum(b.price) desc;

select a.custno, a.custname, 
case when grade = 'A' then 'VIP' when grade = 'B' then '일반' else '직원' end as grade,
sum(b.price)
from member_tbl_02 a, money_tbl_02 b
where a.custno = b.custno(+)
group by a.custno, a.custname, a.grade
order by sum(b.price) desc;

