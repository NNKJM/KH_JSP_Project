CREATE TABLE ASK_MARKET (
	ASK_NO NUMBER(5) PRIMARY KEY,			-- 게시판 글번호
    ASK_USERID VARCHAR2(30) NOT NULL,		-- 문의자 아이디
    ASK_TITLE VARCHAR2(30) NOT NULL,		-- 글 제목
    ASK_CONTENT VARCHAR2(1000) NOT NULL,	-- 글 내용
    ASK_IMAGE VARCHAR2(100),				-- 이미지
    ASK_DATE DATE,							-- 게시판 글 작성일자
    ASK_STATUS CHAR(1) CHECK(ASK_STATUS IN ('0', '1')), -- 답변상태
    ASK_REPLY VARCHAR2(1000),    -- 답변내용
    ASK_REPLYDATE DATE -- 답변일자
);

INSERT INTO ASK_MARKET VALUES(1, 'wonbin', '원빈 테스트제목1', '원빈 테스트내용1', '', '22/04/15', 1, '해당 문의의 답변 내용입니다.', '22/04/16');
INSERT INTO ASK_MARKET VALUES(2, 'wonbin', '원빈 테스트제목2', '원빈 테스트내용2', '', '22/04/21', 1, '해당 문의의 답변 내용입니다.', '22/04/22');
INSERT INTO ASK_MARKET VALUES(3, 'wonbin', '원빈 테스트제목3', '원빈 테스트내용3', '', '22/05/11', 0, '', '');
INSERT INTO ASK_MARKET VALUES(4, 'dongseok', '마동석 테스트제목1', '마동석 테스트내용1', '', '22/04/26', 1, '해당 문의의 답변 내용입니다.', '22/04/27');
INSERT INTO ASK_MARKET VALUES(5, 'dongseok', '마동석 테스트제목2', '마동석 테스트내용2', '', '22/05/05', 0, '', '');
INSERT INTO ASK_MARKET VALUES(6, 'IU', '아이유 테스트제목1', '아이유 테스트제목1', '', '22/05/01', 1, '해당 문의의 답변 내용입니다.', '22/05/04');
INSERT INTO ASK_MARKET VALUES(7, 'IU', '아이유 테스트제목2', '아이유 테스트제목2', '', '22/05/06', 0, '', '');