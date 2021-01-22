-- 운동장 예약

DROP TABLE item;
DROP TABLE board;
DROP TABLE member;

DROP SEQUENCE member_seq;
DROP SEQUENCE board_seq;


-- member 테이블
CREATE TABLE MEMBER
(	
userIdx NUMBER NOT NULL ENABLE, 
userId VARCHAR2(1000) NOT NULL UNIQUE, 
userPw VARCHAR2(1000) NOT NULL, 
userName VARCHAR2(1000) NOT NULL, 
userSN VARCHAR2(1000) NOT NULL UNIQUE, 
userAddr VARCHAR2(1000),
userEmail VARCHAR2(1000) NOT NULL UNIQUE, 	
userTel VARCHAR2(1000) NOT NULL UNIQUE, 
CONSTRAINT MEMBER_PK PRIMARY KEY (userIdx)
);

-- member 시퀀스
CREATE SEQUENCE member_seq INCREMENT BY 1 START WITH 1 MAXVALUE 999999 NOCYCLE NOCACHE;
ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
-- board 테이블
CREATE TABLE BOARD 
(
bIdx NUMBER NOT NULL CONSTRAINT BOARD_PK PRIMARY KEY, 
bTitle VARCHAR2(1000) NOT NULL, 
bWriter VARCHAR2(1000) NOT NULL,
bContent VARCHAR2(4000) NOT NULL,
bType NUMBER,
bIsOpen VARCHAR2(1000) DEFAULT '1',
bDate DATE,
userIdx NUMBER NOT NULL,
bRef NUMBER,
bStep NUMBER DEFAULT 0,
bDepth NUMBER,
bDelete NUMBER DEFAULT 1, 
bHit NUMBER,
bImage VARCHAR2(1000),
CONSTRAINT BOARD_FK FOREIGN KEY (userIdx) REFERENCES MEMBER (userIdx)  
);

-- BOARD 시퀀스
CREATE SEQUENCE BOARD_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 999999 NOCYCLE NOCACHE;
ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
-- item 테이블
CREATE TABLE ITEM 
(
userId VARCHAR2(1000),
iMonth NUMBER NOT NULL,
iDay NUMBER NOT NULL,
iTime NUMBER NOT NULL, 
iReserve VARCHAR2(1000) DEFAULT 'no',
CONSTRAINT ITEM_FK FOREIGN KEY (userId) REFERENCES MEMBER (userId)  
);

ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
-- member 테스트 데이터
insert into member values (member_seq.nextval, 'admin', '1111', 'admin', '910101-1010111', '서울', 'admin@gmail.com', '010-0000-0000');
insert into member values (member_seq.nextval, 'user01', '1111', 'user01', '920101-1010111', '서울', 'user01@gmail.com', '010-1111-1111');
insert into member values (member_seq.nextval, 'user02', '2222', 'user02', '920202-1010111', '서울', 'user02@gmail.com', '010-1111-2222');
insert into member values (member_seq.nextval, 'user03', '3333', 'user03', '920303-1010111', '서울', 'user03@gmail.com', '010-1111-3333');
insert into member values (member_seq.nextval, 'user04', '4444', 'user04', '920404-1010111', '서울', 'user04@gmail.com', '010-1111-4444');
insert into member values (member_seq.nextval, 'user05', '5555', 'user05', '920505-1010111', '서울', 'user05@gmail.com', '010-1111-5555');
insert into member values (member_seq.nextval, 'user06', '6666', 'user06', '920606-1010111', '서울', 'user06@gmail.com', '010-1111-6666');
insert into member values (member_seq.nextval, 'user07', '7777', 'user07', '920707-1010111', '서울', 'user07@gmail.com', '010-1111-7777');
insert into member values (member_seq.nextval, 'user08', '8888', 'user08', '920808-1010111', '서울', 'user08@gmail.com', '010-1111-8888');
insert into member values (member_seq.nextval, 'user09', '9999', 'user09', '920909-1010111', '서울', 'user09@gmail.com', '010-1111-9999');
insert into member values (member_seq.nextval, 'user10', '1010', 'user10', '921010-1010111', '서울', 'user10@gmail.com', '010-1111-1010');
insert into member values (member_seq.nextval, 'user11', '1111', 'user11', '921111-1010111', '서울', 'user11@gmail.com', '010-2222-1111');
insert into member values (member_seq.nextval, 'user12', '1212', 'user12', '921212-1010111', '서울', 'user12@gmail.com', '010-2222-2222');
insert into member values (member_seq.nextval, 'user13', '1313', 'user13', '930101-1010111', '서울', 'user13@gmail.com', '010-2222-3333');
insert into member values (member_seq.nextval, 'user14', '1414', 'user14', '930202-1010111', '서울', 'user14@gmail.com', '010-2222-4444');
insert into member values (member_seq.nextval, 'user15', '1515', 'user15', '930303-1010111', '서울', 'user15@gmail.com', '010-2222-5555');
insert into member values (member_seq.nextval, 'user16', '1616', 'user16', '930404-1010111', '서울', 'user16@gmail.com', '010-2222-6666');
insert into member values (member_seq.nextval, 'user17', '1717', 'user17', '930505-1010111', '서울', 'user17@gmail.com', '010-2222-7777');
insert into member values (member_seq.nextval, 'user18', '1818', 'user18', '930606-1010111', '서울', 'user18@gmail.com', '010-2222-8888');
insert into member values (member_seq.nextval, 'user19', '1919', 'user19', '930707-1010111', '서울', 'user19@gmail.com', '010-2222-9999');
insert into member values (member_seq.nextval, 'user20', '2020', 'user20', '930808-1010111', '서울', 'user20@gmail.com', '010-2222-1010');
COMMIT;

-- board 테스트 데이터
insert into BOARD (BIDX ,BWRITER, BTITLE, BCONTENT, BISOPEN, USERIDX, BREF, BDEPTH, BDATE, BDELETE, BTYPE, BHIT) 
values (BOARD_SEQ.NEXTVAL, 'admin', '공개 게시글(Review)', '게시글 내용', '1', 1, BOARD_SEQ.NEXTVAL, 0, SYSDATE, 1, 1, 0);
insert into BOARD (BIDX ,BWRITER, BTITLE, BCONTENT, BISOPEN, USERIDX, BREF, BDEPTH, BDATE, BDELETE, BTYPE, BHIT) 
values (BOARD_SEQ.NEXTVAL, 'admin', '공개 게시글(QnA)', '게시글 내용', '1', 1, BOARD_SEQ.NEXTVAL, 0, SYSDATE, 1, 2, 0);
insert into BOARD (BIDX ,BWRITER, BTITLE, BCONTENT, BISOPEN, USERIDX, BREF, BDEPTH, BDATE, BDELETE, BTYPE, BHIT) 
values (BOARD_SEQ.NEXTVAL, 'admin', '삭제 게시글', '게시글 내용', '1', 1, BOARD_SEQ.NEXTVAL, 0, SYSDATE, 0, 1, 0);
insert into BOARD (BIDX ,BWRITER, BTITLE, BCONTENT, BISOPEN, USERIDX, BREF, BDEPTH, BDATE, BDELETE, BTYPE, BHIT) 
values (BOARD_SEQ.NEXTVAL, 'admin', '비공개 게시글(Review)', '게시글 내용', '0', 1, BOARD_SEQ.NEXTVAL, 0, SYSDATE, 1, 1, 0);
insert into BOARD (BIDX ,BWRITER, BTITLE, BCONTENT, BISOPEN, USERIDX, BREF, BDEPTH, BDATE, BDELETE, BTYPE, BHIT) 
values (BOARD_SEQ.NEXTVAL, 'admin', '비공개 게시글(QnA)', '게시글 내용', '0', 1, BOARD_SEQ.NEXTVAL, 0, SYSDATE, 1, 2, 0);
insert into BOARD (BIDX ,BWRITER, BTITLE, BCONTENT, BISOPEN, USERIDX, BREF, BDEPTH, BDATE, BDELETE, BTYPE, BHIT) 
values (BOARD_SEQ.NEXTVAL, 'admin', '삭제 게시글', '게시글 내용', '0', 1, BOARD_SEQ.NEXTVAL, 0, SYSDATE, 0, 1, 0);
insert into BOARD (BIDX ,BWRITER, BTITLE, BCONTENT, BISOPEN, USERIDX, BREF, BDEPTH, BDATE, BDELETE, BTYPE, BHIT) 
values (BOARD_SEQ.NEXTVAL, 'user01', '공개 게시글(Review)', '게시글 내용', '1', 2, BOARD_SEQ.NEXTVAL, 0, SYSDATE, 1, 1, 0);
insert into BOARD (BIDX ,BWRITER, BTITLE, BCONTENT, BISOPEN, USERIDX, BREF, BDEPTH, BDATE, BDELETE, BTYPE, BHIT) 
values (BOARD_SEQ.NEXTVAL, 'user01', '공개 게시글(QnA)', '게시글 내용', '1', 2, BOARD_SEQ.NEXTVAL, 0, SYSDATE, 1, 2, 0);
insert into BOARD (BIDX ,BWRITER, BTITLE, BCONTENT, BISOPEN, USERIDX, BREF, BDEPTH, BDATE, BDELETE, BTYPE, BHIT) 
values (BOARD_SEQ.NEXTVAL, 'user01', '삭제 게시글', '게시글 내용', '1', 2, BOARD_SEQ.NEXTVAL, 0, SYSDATE, 0, 1, 0);
insert into BOARD (BIDX ,BWRITER, BTITLE, BCONTENT, BISOPEN, USERIDX, BREF, BDEPTH, BDATE, BDELETE, BTYPE, BHIT) 
values (BOARD_SEQ.NEXTVAL, 'user01', '비공개 게시글(Review)', '게시글 내용', '0', 2, BOARD_SEQ.NEXTVAL, 0, SYSDATE, 1, 1, 0);
insert into BOARD (BIDX ,BWRITER, BTITLE, BCONTENT, BISOPEN, USERIDX, BREF, BDEPTH, BDATE, BDELETE, BTYPE, BHIT) 
values (BOARD_SEQ.NEXTVAL, 'user01', '비공개 게시글(QnA)', '게시글 내용', '0', 2, BOARD_SEQ.NEXTVAL, 0, SYSDATE, 1, 2, 0);
insert into BOARD (BIDX ,BWRITER, BTITLE, BCONTENT, BISOPEN, USERIDX, BREF, BDEPTH, BDATE, BDELETE, BTYPE, BHIT) 
values (BOARD_SEQ.NEXTVAL, 'user01', '삭제 게시글', '게시글 내용', '0', 2, BOARD_SEQ.NEXTVAL, 0, SYSDATE, 0, 1, 0);
insert into BOARD (BIDX ,BWRITER, BTITLE, BCONTENT, BISOPEN, USERIDX, BREF, BDEPTH, BDATE, BDELETE, BTYPE, BHIT) 
values (BOARD_SEQ.NEXTVAL, 'user02', '공개 게시글(Review)', '게시글 내용', '1', 3, BOARD_SEQ.NEXTVAL, 0, SYSDATE, 1, 1, 0);
insert into BOARD (BIDX ,BWRITER, BTITLE, BCONTENT, BISOPEN, USERIDX, BREF, BDEPTH, BDATE, BDELETE, BTYPE, BHIT) 
values (BOARD_SEQ.NEXTVAL, 'user02', '공개 게시글(QnA)', '게시글 내용', '1', 3, BOARD_SEQ.NEXTVAL, 0, SYSDATE, 1, 2, 0);
insert into BOARD (BIDX ,BWRITER, BTITLE, BCONTENT, BISOPEN, USERIDX, BREF, BDEPTH, BDATE, BDELETE, BTYPE, BHIT) 
values (BOARD_SEQ.NEXTVAL, 'user02', '삭제 게시글', '게시글 내용', '1', 3, BOARD_SEQ.NEXTVAL, 0, SYSDATE, 0, 1, 0);
insert into BOARD (BIDX ,BWRITER, BTITLE, BCONTENT, BISOPEN, USERIDX, BREF, BDEPTH, BDATE, BDELETE, BTYPE, BHIT) 
values (BOARD_SEQ.NEXTVAL, 'user02', '비공개 게시글(Review)', '게시글 내용', '0', 3, BOARD_SEQ.NEXTVAL, 0, SYSDATE, 1, 1, 0);
insert into BOARD (BIDX ,BWRITER, BTITLE, BCONTENT, BISOPEN, USERIDX, BREF, BDEPTH, BDATE, BDELETE, BTYPE, BHIT) 
values (BOARD_SEQ.NEXTVAL, 'user02', '비공개 게시글(QnA)', '게시글 내용', '0', 3, BOARD_SEQ.NEXTVAL, 0, SYSDATE, 1, 2, 0);
insert into BOARD (BIDX ,BWRITER, BTITLE, BCONTENT, BISOPEN, USERIDX, BREF, BDEPTH, BDATE, BDELETE, BTYPE, BHIT) 
values (BOARD_SEQ.NEXTVAL, 'user02', '삭제 게시글', '게시글 내용', '0', 3, BOARD_SEQ.NEXTVAL, 0, SYSDATE, 0, 1, 0);
insert into BOARD (BIDX ,BWRITER, BTITLE, BCONTENT, BISOPEN, USERIDX, BREF, BDEPTH, BDATE, BDELETE, BTYPE, BHIT) 
values (BOARD_SEQ.NEXTVAL, 'user03', '공개 게시글(Review)', '게시글 내용', '1', 4, BOARD_SEQ.NEXTVAL, 0, SYSDATE, 1, 1, 0);
insert into BOARD (BIDX ,BWRITER, BTITLE, BCONTENT, BISOPEN, USERIDX, BREF, BDEPTH, BDATE, BDELETE, BTYPE, BHIT) 
values (BOARD_SEQ.NEXTVAL, 'user03', '공개 게시글(QnA)', '게시글 내용', '1', 4, BOARD_SEQ.NEXTVAL, 0, SYSDATE, 1, 2, 0);
insert into BOARD (BIDX ,BWRITER, BTITLE, BCONTENT, BISOPEN, USERIDX, BREF, BDEPTH, BDATE, BDELETE, BTYPE, BHIT) 
values (BOARD_SEQ.NEXTVAL, 'user03', '삭제 게시글', '게시글 내용', '1', 4, BOARD_SEQ.NEXTVAL, 0, SYSDATE, 0, 1, 0);
insert into BOARD (BIDX ,BWRITER, BTITLE, BCONTENT, BISOPEN, USERIDX, BREF, BDEPTH, BDATE, BDELETE, BTYPE, BHIT) 
values (BOARD_SEQ.NEXTVAL, 'user03', '비공개 게시글(Review)', '게시글 내용', '0', 4, BOARD_SEQ.NEXTVAL, 0, SYSDATE, 1, 1, 0);
insert into BOARD (BIDX ,BWRITER, BTITLE, BCONTENT, BISOPEN, USERIDX, BREF, BDEPTH, BDATE, BDELETE, BTYPE, BHIT) 
values (BOARD_SEQ.NEXTVAL, 'user03', '비공개 게시글(QnA)', '게시글 내용', '0', 4, BOARD_SEQ.NEXTVAL, 0, SYSDATE, 1, 2, 0);
insert into BOARD (BIDX ,BWRITER, BTITLE, BCONTENT, BISOPEN, USERIDX, BREF, BDEPTH, BDATE, BDELETE, BTYPE, BHIT) 
values (BOARD_SEQ.NEXTVAL, 'user03', '삭제 게시글', '게시글 내용', '0', 4, BOARD_SEQ.NEXTVAL, 0, SYSDATE, 0, 1, 0);
insert into BOARD (BIDX ,BWRITER, BTITLE, BCONTENT, BISOPEN, USERIDX, BREF, BDEPTH, BDATE, BDELETE, BTYPE, BHIT) 
values (BOARD_SEQ.NEXTVAL, 'user04', '공개 게시글(Review)', '게시글 내용', '1', 5, BOARD_SEQ.NEXTVAL, 0, SYSDATE, 1, 1, 0);
insert into BOARD (BIDX ,BWRITER, BTITLE, BCONTENT, BISOPEN, USERIDX, BREF, BDEPTH, BDATE, BDELETE, BTYPE, BHIT) 
values (BOARD_SEQ.NEXTVAL, 'user04', '공개 게시글(QnA)', '게시글 내용', '1', 5, BOARD_SEQ.NEXTVAL, 0, SYSDATE, 1, 2, 0);
insert into BOARD (BIDX ,BWRITER, BTITLE, BCONTENT, BISOPEN, USERIDX, BREF, BDEPTH, BDATE, BDELETE, BTYPE, BHIT) 
values (BOARD_SEQ.NEXTVAL, 'user04', '삭제 게시글', '게시글 내용', '1', 5, BOARD_SEQ.NEXTVAL, 0, SYSDATE, 0, 1, 0);
insert into BOARD (BIDX ,BWRITER, BTITLE, BCONTENT, BISOPEN, USERIDX, BREF, BDEPTH, BDATE, BDELETE, BTYPE, BHIT) 
values (BOARD_SEQ.NEXTVAL, 'user04', '비공개 게시글(Review)', '게시글 내용', '0', 5, BOARD_SEQ.NEXTVAL, 0, SYSDATE, 1, 1, 0);
insert into BOARD (BIDX ,BWRITER, BTITLE, BCONTENT, BISOPEN, USERIDX, BREF, BDEPTH, BDATE, BDELETE, BTYPE, BHIT) 
values (BOARD_SEQ.NEXTVAL, 'user04', '비공개 게시글(QnA)', '게시글 내용', '0', 5, BOARD_SEQ.NEXTVAL, 0, SYSDATE, 1, 2, 0);
insert into BOARD (BIDX ,BWRITER, BTITLE, BCONTENT, BISOPEN, USERIDX, BREF, BDEPTH, BDATE, BDELETE, BTYPE, BHIT) 
values (BOARD_SEQ.NEXTVAL, 'user04', '삭제 게시글', '게시글 내용', '0', 5, BOARD_SEQ.NEXTVAL, 0, SYSDATE, 0, 1, 0);
COMMIT;

-- ITEM 테스트 데이터
UPDATE ITEM SET USERID='user01', IRESERVE = 'yes'
WHERE  IMONTH=2 AND IDAY=14 AND ITIME=1;
UPDATE ITEM SET USERID='user01', IRESERVE = 'yes'
WHERE  IMONTH=2 AND IDAY=14 AND ITIME=2;
UPDATE ITEM SET USERID='user01', IRESERVE = 'yes'
WHERE  IMONTH=2 AND IDAY=14 AND ITIME=3;
UPDATE ITEM SET USERID='user02', IRESERVE = 'yes'
WHERE  IMONTH=2 AND IDAY=17 AND ITIME=1;
UPDATE ITEM SET USERID='user02', IRESERVE = 'yes'
WHERE  IMONTH=2 AND IDAY=17 AND ITIME=2;
UPDATE ITEM SET USERID='user02', IRESERVE = 'yes'
WHERE  IMONTH=2 AND IDAY=17 AND ITIME=3;
UPDATE ITEM SET USERID='user03', IRESERVE = 'yes'
WHERE  IMONTH=2 AND IDAY=18 AND ITIME=1;
UPDATE ITEM SET USERID='user03', IRESERVE = 'yes'
WHERE  IMONTH=2 AND IDAY=18 AND ITIME=2;
UPDATE ITEM SET USERID='user03', IRESERVE = 'yes'
WHERE  IMONTH=2 AND IDAY=18 AND ITIME=3;
UPDATE ITEM SET USERID='user04', IRESERVE = 'yes'
WHERE  IMONTH=2 AND IDAY=19 AND ITIME=1;
UPDATE ITEM SET USERID='user04', IRESERVE = 'yes'
WHERE  IMONTH=2 AND IDAY=19 AND ITIME=2;
UPDATE ITEM SET USERID='user04', IRESERVE = 'yes'
WHERE  IMONTH=2 AND IDAY=19 AND ITIME=3;
COMMIT;