create table admin_market(
	admin_id varchar2(30) primary key,		-- 관리자 아이디
	admin_pwd varchar2(30) not null,		-- 관리자 비밀번호
	admin_name varchar2(50) not null,		-- 관리자 이름
	admin_email varchar2(200),				-- 관리자 이메일
	admin_date date							-- 관리자 등록일
);

insert into admin_market values('admin', 'admin1234', '관리자', 'admin@naver.com', sysdate);