create table user_market(
    user_no number(10) primary key,               -- 회원 번호
    user_id varchar(30) not null,                 -- 회원 아이디
    user_pwd varchar2(30) not null,               -- 회원 비밀번호
    user_name varchar2(50) not null,              -- 회원 이름
    user_gender varchar2(5),                      -- 회원 성별
    user_email varchar2(200),                     -- 회원 이메일
    user_address varchar2(200) not null,          -- 회원 주소
    user_detailaddress varchar2(200) not null,    -- 회원 상세주소
    user_phone varchar2(30),                      -- 회원 전화번호
    user_date date,                               -- 회원 가입일
    user_update date                              -- 회원 수정일
);

insert into user_market values(1,'wonbin','1111','원빈','남','wonbin@nate.com','서울특별시 강남구 선릉로8길','21호','010-1234-1234',sysdate,'');
insert into user_market values(2,'gongyu','2222','공유','남','gongyu@naver.com','서울특별시 강서구 화곡로72길','48호','010-1234-1234',sysdate,'');
insert into user_market values(3,'IU','3333','이지은','여','IU@daum.net','서울특별시 구로구 우마길','16-14번지','010-1234-1234',sysdate,'');
insert into user_market values(4,'jihyeon','4444','전지현','여','jihyeon@hanmail.net','서울특별시 도봉구 도당로27길','74호','010-1234-1234',sysdate,'');
insert into user_market values(5,'dongseok','5555','마동석','남','dongseok@gmail.com','서울특별시 마포구 마포대로10길','16호','010-1234-1234',sysdate,'');