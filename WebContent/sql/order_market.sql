create table order_market(
	order_num number(5) primary key,			-- 주문 번호
	order_group number(5) not null,				-- 주문 그룹
	order_userId varchar2(30) not null,			-- 주문자 아이디
	order_userAddr varchar2(200) not null,		-- 배송지
	order_detailAddr varchar2(200) not null, 	-- 상세 주소
	order_pnum number(10) not null,				-- 상품 번호
	order_pname varchar2(50) not null,			-- 상품 이름
	order_image varchar2(100),					-- 상품 이미지
	order_pqty number(10) not null,				-- 상품 수량
	order_price number(10) not null,			-- 상품 가격
	order_total number(10) not null,			-- 총 금액(배송비 제외)
	order_date date	
);