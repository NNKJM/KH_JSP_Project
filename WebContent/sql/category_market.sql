-- shop_category 테이블 생성

create table category_market(
	category_num number(3) primary key,		-- 카테고리 번호
	category_code varchar2(10) not null,		-- 카테고리 코드
	category_name varchar2(100) not null	-- 카테고리 이름
);


insert into category_market values(1, 'A00100001', '채소');
insert into category_market values(2, 'A00100002', '과일');
insert into category_market values(3, 'A00200001', '생선');
insert into category_market values(4, 'A00200002', '오징어·낙지·문어');
insert into category_market values(5, 'A00300001', '육류');
insert into category_market values(6, 'A00400001', '분식');
insert into category_market values(7, 'B00100001', '탄산음료');
insert into category_market values(8, 'B00200001', '커피');
insert into category_market values(9, 'B00200002', '차');
insert into category_market values(10, 'B00300001', '술');
insert into category_market values(11, 'C00200003', '휴지·티슈');
insert into category_market values(12, 'C00200001', '디저트');
insert into category_market values(13, 'D00100001', '가정용품');
insert into category_market values(14, 'D00300001', '가전제품');