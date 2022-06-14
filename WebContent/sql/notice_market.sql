-- notice_market 테이블 생성

CREATE TABLE NOTICE_MARKET (
	NOTICE_NO NUMBER(5) PRIMARY KEY,
	ADMIN_ID VARCHAR2(30) NOT NULL, -- 작성자 ID
    ADMIN_NAME VARCHAR2(30) NOT NULL, -- 작성자 닉네임
    NOTICE_TITLE VARCHAR2(200) NOT NULL,
    NOTICE_CONTENT VARCHAR2(1000) NOT NULL,
    NOTICE_HIT NUMBER(5) DEFAULT 0,
    NOTICE_DATE DATE,
    NOTICE_UPDATE DATE
);

INSERT INTO NOTICE_MARKET VALUES (1, 'admin', '관리자', 'test_제목1', 'test_내용1', 44, '22/03/01', NULL);
INSERT INTO NOTICE_MARKET VALUES (2, 'admin', '관리자', 'test_제목2', 'test_내용2', 25, '22/03/01', NULL);
INSERT INTO NOTICE_MARKET VALUES (3, 'admin', '관리자', 'test_제목3', 'test_내용3', 30, '22/03/01', '22/03/21');
INSERT INTO NOTICE_MARKET VALUES (4, 'admin', '관리자', 'test_제목4', 'test_내용4', 65, '22/03/01', NULL);
INSERT INTO NOTICE_MARKET VALUES (5, 'admin', '관리자', 'test_제목5', 'test_내용5', 163, '22/03/02', NULL);
INSERT INTO NOTICE_MARKET VALUES (6, 'admin', '관리자', 'test_제목6', 'test_내용6', 52, '22/03/02', NULL);
INSERT INTO NOTICE_MARKET VALUES (7, 'admin', '관리자', 'test_제목7', 'test_내용7', 25, '22/03/02', NULL);
INSERT INTO NOTICE_MARKET VALUES (8, 'admin', '관리자', 'test_제목8', 'test_내용8', 3, '22/03/02', NULL);
INSERT INTO NOTICE_MARKET VALUES (9, 'admin', '관리자', 'test_제목9', 'test_내용9', 176, '22/03/04', NULL);
INSERT INTO NOTICE_MARKET VALUES (10, 'admin', '관리자', 'test_제목10', 'test_내용10', 2545, '22/03/05', NULL);
INSERT INTO NOTICE_MARKET VALUES (11, 'admin', '관리자', 'test_제목11', 'test_내용11', 152, '22/03/06', NULL);
INSERT INTO NOTICE_MARKET VALUES (12, 'admin', '관리자', 'test_제목12', 'test_내용12', 423, '22/03/06', NULL);
INSERT INTO NOTICE_MARKET VALUES (13, 'admin', '관리자', 'test_제목13', 'test_내용13', 15, '22/03/06', NULL);
INSERT INTO NOTICE_MARKET VALUES (14, 'admin', '관리자', 'test_제목14', 'test_내용14', 621, '22/03/07', NULL);
INSERT INTO NOTICE_MARKET VALUES (15, 'admin', '관리자', 'test_제목15', 'test_내용15', 12, '22/03/08', NULL);
INSERT INTO NOTICE_MARKET VALUES (16, 'admin', '관리자', 'test_제목16', 'test_내용16', 46, '22/03/10', NULL);
INSERT INTO NOTICE_MARKET VALUES (17, 'admin', '관리자', 'test_제목17', 'test_내용17', 11, '22/03/10', NULL);
INSERT INTO NOTICE_MARKET VALUES (18, 'admin', '관리자', 'test_제목18', 'test_내용18', 41, '22/03/10', NULL);
INSERT INTO NOTICE_MARKET VALUES (19, 'admin', '관리자', 'test_제목19', 'test_내용19', 112, '22/03/11', NULL);
INSERT INTO NOTICE_MARKET VALUES (20, 'admin', '관리자', 'test_제목20', 'test_내용20', 17, '22/03/12', NULL);
INSERT INTO NOTICE_MARKET VALUES (21, 'admin', '관리자', 'test_제목21', 'test_내용21', 132, '22/03/12', NULL);
INSERT INTO NOTICE_MARKET VALUES (22, 'admin', '관리자', 'test_제목22', 'test_내용22', 142, '22/03/12', NULL);
INSERT INTO NOTICE_MARKET VALUES (23, 'admin', '관리자', 'test_제목23', 'test_내용23', 16, '22/03/13', NULL);
INSERT INTO NOTICE_MARKET VALUES (24, 'admin', '관리자', 'test_제목24', 'test_내용24', 62, '22/03/15', NULL);
INSERT INTO NOTICE_MARKET VALUES (25, 'admin', '관리자', 'test_제목25', 'test_내용25', 45, '22/03/16', '22/03/27');
INSERT INTO NOTICE_MARKET VALUES (26, 'admin', '관리자', 'test_제목26', 'test_내용26', 5323, '22/03/16', NULL);
INSERT INTO NOTICE_MARKET VALUES (27, 'admin', '관리자', 'test_제목27', 'test_내용27', 436, '22/03/17', NULL);
INSERT INTO NOTICE_MARKET VALUES (28, 'admin', '관리자', 'test_제목28', 'test_내용28', 523, '22/03/17', '22/04/02');
INSERT INTO NOTICE_MARKET VALUES (29, 'admin', '관리자', 'test_제목29', 'test_내용29', 5125, '22/03/17', NULL);
INSERT INTO NOTICE_MARKET VALUES (30, 'admin', '관리자', 'test_제목30', 'test_내용30', 4, '22/03/18', NULL);
INSERT INTO NOTICE_MARKET VALUES (31, 'admin', '관리자', 'test_제목31', 'test_내용31', 1231, '22/03/18', NULL);
INSERT INTO NOTICE_MARKET VALUES (32, 'admin', '관리자', 'test_제목32', 'test_내용32', 152, '22/03/20', NULL);
INSERT INTO NOTICE_MARKET VALUES (33, 'admin', '관리자', 'test_제목33', 'test_내용33', 798, '22/03/21', NULL);
INSERT INTO NOTICE_MARKET VALUES (34, 'admin', '관리자', 'test_제목34', 'test_내용34', 5688, '22/03/22', NULL);
INSERT INTO NOTICE_MARKET VALUES (35, 'admin', '관리자', 'test_제목35', 'test_내용35', 865, '22/03/26', NULL);
INSERT INTO NOTICE_MARKET VALUES (36, 'admin', '관리자', 'test_제목36', 'test_내용36', 564, '22/03/27', '22/04/06');
INSERT INTO NOTICE_MARKET VALUES (37, 'admin', '관리자', 'test_제목37', 'test_내용37', 347, '22/04/01', NULL);
INSERT INTO NOTICE_MARKET VALUES (38, 'admin', '관리자', 'test_제목38', 'test_내용38', 989, '22/04/02', NULL);
INSERT INTO NOTICE_MARKET VALUES (39, 'admin', '관리자', 'test_제목39', 'test_내용39', 4756, '22/04/02', NULL);
INSERT INTO NOTICE_MARKET VALUES (41, 'admin', '관리자', 'test_제목41', 'test_내용41', 457, '22/04/02', NULL);
INSERT INTO NOTICE_MARKET VALUES (42, 'admin', '관리자', 'test_제목42', 'test_내용42', 3634, '22/04/03', NULL);
INSERT INTO NOTICE_MARKET VALUES (43, 'admin', '관리자', 'test_제목43', 'test_내용43', 4265, '22/04/04', NULL);
INSERT INTO NOTICE_MARKET VALUES (44, 'admin', '관리자', 'test_제목44', 'test_내용44', 90, '22/04/04', '22/05/02');
INSERT INTO NOTICE_MARKET VALUES (45, 'admin', '관리자', 'test_제목45', 'test_내용45', 684, '22/04/05', NULL);
INSERT INTO NOTICE_MARKET VALUES (46, 'admin', '관리자', 'test_제목46', 'test_내용46', 37466, '22/04/05', NULL);
INSERT INTO NOTICE_MARKET VALUES (47, 'admin', '관리자', 'test_제목47', 'test_내용47', 2437, '22/04/05', NULL);
INSERT INTO NOTICE_MARKET VALUES (48, 'admin', '관리자', 'test_제목48', 'test_내용48', 1242, '22/04/05', NULL);
INSERT INTO NOTICE_MARKET VALUES (49, 'admin', '관리자', 'test_제목49', 'test_내용49', 442, '22/04/06', NULL);
INSERT INTO NOTICE_MARKET VALUES (50, 'admin', '관리자', 'test_제목50', 'test_내용50', 567, '22/04/06', NULL);
INSERT INTO NOTICE_MARKET VALUES (51, 'admin', '관리자', 'test_제목51', 'test_내용51', 451, '22/04/06', NULL);
INSERT INTO NOTICE_MARKET VALUES (52, 'admin', '관리자', 'test_제목52', 'test_내용52', 152, '22/04/06', NULL);
INSERT INTO NOTICE_MARKET VALUES (53, 'admin', '관리자', 'test_제목53', 'test_내용53', 156, '22/04/07', '22/05/13');
INSERT INTO NOTICE_MARKET VALUES (54, 'admin', '관리자', 'test_제목54', 'test_내용54', 65, '22/04/07', NULL);
INSERT INTO NOTICE_MARKET VALUES (55, 'admin', '관리자', 'test_제목55', 'test_내용55', 122, '22/04/08', '22/04/23');
INSERT INTO NOTICE_MARKET VALUES (56, 'admin', '관리자', 'test_제목56', 'test_내용56', 612, '22/04/08', NULL);
INSERT INTO NOTICE_MARKET VALUES (57, 'admin', '관리자', 'test_제목57', 'test_내용57', 535, '22/04/08', NULL);
INSERT INTO NOTICE_MARKET VALUES (58, 'admin', '관리자', 'test_제목58', 'test_내용58', 423, '22/04/09', NULL);
INSERT INTO NOTICE_MARKET VALUES (59, 'admin', '관리자', 'test_제목59', 'test_내용59', 5255, '22/04/09', NULL);
INSERT INTO NOTICE_MARKET VALUES (60, 'admin', '관리자', 'test_제목60', 'test_내용60', 325, '22/04/10', '22/04/14');
INSERT INTO NOTICE_MARKET VALUES (61, 'admin', '관리자', 'test_제목61', 'test_내용61', 687, '22/04/11', NULL);
INSERT INTO NOTICE_MARKET VALUES (62, 'admin', '관리자', 'test_제목62', 'test_내용62', 11, '22/04/12', NULL);
INSERT INTO NOTICE_MARKET VALUES (63, 'admin', '관리자', 'test_제목63', 'test_내용63', 2124, '22/04/12', NULL);
INSERT INTO NOTICE_MARKET VALUES (64, 'admin', '관리자', 'test_제목64', 'test_내용64', 354, '22/04/12', NULL);
INSERT INTO NOTICE_MARKET VALUES (65, 'admin', '관리자', 'test_제목65', 'test_내용65', 451, '22/04/12', NULL);
INSERT INTO NOTICE_MARKET VALUES (66, 'admin', '관리자', 'test_제목66', 'test_내용66', 757, '22/04/13', NULL);
INSERT INTO NOTICE_MARKET VALUES (67, 'admin', '관리자', 'test_제목67', 'test_내용67', 8844, '22/04/14', NULL);
INSERT INTO NOTICE_MARKET VALUES (68, 'admin', '관리자', 'test_제목68', 'test_내용68', 4564, '22/04/14', NULL);
INSERT INTO NOTICE_MARKET VALUES (69, 'admin', '관리자', 'test_제목69', 'test_내용69', 42, '22/04/15', NULL);
INSERT INTO NOTICE_MARKET VALUES (70, 'admin', '관리자', 'test_제목70', 'test_내용70', 345, '22/04/16', NULL);
INSERT INTO NOTICE_MARKET VALUES (71, 'admin', '관리자', 'test_제목71', 'test_내용71', 1566, '22/04/16', NULL);
INSERT INTO NOTICE_MARKET VALUES (72, 'admin', '관리자', 'test_제목72', 'test_내용72', 18, '22/04/17', NULL);
INSERT INTO NOTICE_MARKET VALUES (73, 'admin', '관리자', 'test_제목73', 'test_내용73', 743, '22/04/20', NULL);
INSERT INTO NOTICE_MARKET VALUES (74, 'admin', '관리자', 'test_제목74', 'test_내용74', 5436, '22/04/21', NULL);
INSERT INTO NOTICE_MARKET VALUES (75, 'admin', '관리자', 'test_제목75', 'test_내용75', 453, '22/04/23', NULL);
INSERT INTO NOTICE_MARKET VALUES (76, 'admin', '관리자', 'test_제목76', 'test_내용76', 1234, '22/04/24', NULL);
INSERT INTO NOTICE_MARKET VALUES (77, 'admin', '관리자', 'test_제목77', 'test_내용77', 6267, '22/04/25', NULL);
INSERT INTO NOTICE_MARKET VALUES (78, 'admin', '관리자', 'test_제목78', 'test_내용78', 523, '22/04/27', NULL);
INSERT INTO NOTICE_MARKET VALUES (79, 'admin', '관리자', 'test_제목79', 'test_내용79', 4167, '22/04/28', NULL);
INSERT INTO NOTICE_MARKET VALUES (80, 'admin', '관리자', 'test_제목80', 'test_내용80', 1299, '22/04/028', NULL);
INSERT INTO NOTICE_MARKET VALUES (81, 'admin', '관리자', 'test_제목81', 'test_내용81', 442, '22/04/29', '22/05/12');
INSERT INTO NOTICE_MARKET VALUES (82, 'admin', '관리자', 'test_제목82', 'test_내용82', 23, '22/04/30', NULL);
INSERT INTO NOTICE_MARKET VALUES (83, 'admin', '관리자', 'test_제목83', 'test_내용83', 421, '22/04/30', NULL);
INSERT INTO NOTICE_MARKET VALUES (84, 'admin', '관리자', 'test_제목84', 'test_내용84', 3133, '22/05/01', NULL);
INSERT INTO NOTICE_MARKET VALUES (85, 'admin', '관리자', 'test_제목85', 'test_내용85', 2515, '22/05/01', NULL);
INSERT INTO NOTICE_MARKET VALUES (86, 'admin', '관리자', 'test_제목86', 'test_내용86', 552, '22/05/02', NULL);
INSERT INTO NOTICE_MARKET VALUES (87, 'admin', '관리자', 'test_제목87', 'test_내용87', 355, '22/05/02', NULL);
INSERT INTO NOTICE_MARKET VALUES (88, 'admin', '관리자', 'test_제목88', 'test_내용88', 53, '22/05/02', NULL);
INSERT INTO NOTICE_MARKET VALUES (89, 'admin', '관리자', 'test_제목89', 'test_내용89', 79, '22/05/03', NULL);
INSERT INTO NOTICE_MARKET VALUES (90, 'admin', '관리자', 'test_제목90', 'test_내용90', 745, '22/05/03', '22/05/11');
INSERT INTO NOTICE_MARKET VALUES (91, 'admin', '관리자', 'test_제목91', 'test_내용91', 997, '22/05/04', NULL);
INSERT INTO NOTICE_MARKET VALUES (92, 'admin', '관리자', 'test_제목92', 'test_내용92', 658, '22/05/06', NULL);
INSERT INTO NOTICE_MARKET VALUES (93, 'admin', '관리자', 'test_제목93', 'test_내용93', 56, '22/05/06', NULL);
INSERT INTO NOTICE_MARKET VALUES (94, 'admin', '관리자', 'test_제목94', 'test_내용94', 97, '22/05/07', '22/05/10');
INSERT INTO NOTICE_MARKET VALUES (95, 'admin', '관리자', 'test_제목95', 'test_내용95', 64, '22/05/08', NULL);
INSERT INTO NOTICE_MARKET VALUES (96, 'admin', '관리자', 'test_제목96', 'test_내용96', 97, '22/05/09', NULL);
INSERT INTO NOTICE_MARKET VALUES (97, 'admin', '관리자', 'test_제목97', 'test_내용97', 75, '22/05/10', NULL);
INSERT INTO NOTICE_MARKET VALUES (98, 'admin', '관리자', 'test_제목98', 'test_내용98', 26, '22/05/10', NULL);
INSERT INTO NOTICE_MARKET VALUES (99, 'admin', '관리자', 'test_제목99', 'test_내용99', 53, '22/05/10', NULL);
INSERT INTO NOTICE_MARKET VALUES (100, 'admin', '관리자', 'test_제목100', 'test_내용100', 65, '22/05/11', NULL);
INSERT INTO NOTICE_MARKET VALUES (101, 'admin', '관리자', 'test_제목101', 'test_내용101', 76, '22/05/11', '22/05/14');
INSERT INTO NOTICE_MARKET VALUES (102, 'admin', '관리자', 'test_제목102', 'test_내용102', 51, '22/05/11', NULL);
INSERT INTO NOTICE_MARKET VALUES (103, 'admin', '관리자', 'test_제목103', 'test_내용103', 25, '22/05/12', NULL);
INSERT INTO NOTICE_MARKET VALUES (104, 'admin', '관리자', 'test_제목104', 'test_내용104', 34, '22/05/12', NULL);
INSERT INTO NOTICE_MARKET VALUES (105, 'admin', '관리자', 'test_제목105', 'test_내용105', 61, '22/05/12', NULL);
INSERT INTO NOTICE_MARKET VALUES (106, 'admin', '관리자', 'test_제목106', 'test_내용106', 42, '22/05/12', NULL);
INSERT INTO NOTICE_MARKET VALUES (107, 'admin', '관리자', 'test_제목107', 'test_내용107', 45, '22/05/13', '22/05/15');
INSERT INTO NOTICE_MARKET VALUES (108, 'admin', '관리자', 'test_제목108', 'test_내용108', 16, '22/05/13', NULL);
INSERT INTO NOTICE_MARKET VALUES (109, 'admin', '관리자', 'test_제목109', 'test_내용109', 18, '22/05/13', NULL);
INSERT INTO NOTICE_MARKET VALUES (110, 'admin', '관리자', 'test_제목110', 'test_내용110', 31, '22/05/14', NULL);
INSERT INTO NOTICE_MARKET VALUES (111, 'admin', '관리자', 'test_제목111', 'test_내용111', 21, '22/05/14', NULL);
INSERT INTO NOTICE_MARKET VALUES (112, 'admin', '관리자', 'test_제목112', 'test_내용112', 7, '22/05/14', NULL);
INSERT INTO NOTICE_MARKET VALUES (113, 'admin', '관리자', 'test_제목113', 'test_내용113', 5, '22/05/14', NULL);
INSERT INTO NOTICE_MARKET VALUES (114, 'admin', '관리자', 'test_제목114', 'test_내용114', 4, '22/05/15', NULL);
INSERT INTO NOTICE_MARKET VALUES (115, 'admin', '관리자', 'test_제목115', 'test_내용115', DEFAULT, '22/05/15', NULL);