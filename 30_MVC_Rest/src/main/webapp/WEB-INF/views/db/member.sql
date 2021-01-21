DROP SEQUENCE MEMBER_SEQ;
CREATE SEQUENCE MEMBER_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 999
NOCYCLE
NOCACHE;

DROP TABLE MEMBER;
CREATE TABLE MEMBER
(
	NO NUMBER PRIMARY KEY,
	ID VARCHAR2(50),
	NAME VARCHAR2(100),
	GENDER VARCHAR2(10),
	ADDRESS VARCHAR2(200)
);

INSERT INTO MEMBER VALUES (MEMBER_SEQ.NEXTVAL, 'user1', '제임스', '남', '서울');
INSERT INTO MEMBER VALUES (MEMBER_SEQ.NEXTVAL, 'user2', '앨리스', '여', '인천');
INSERT INTO MEMBER VALUES (MEMBER_SEQ.NEXTVAL, 'user3', '제시카', '여', '부산');
INSERT INTO MEMBER VALUES (MEMBER_SEQ.NEXTVAL, 'user4', '스미스', '남', '제주');
INSERT INTO MEMBER VALUES (MEMBER_SEQ.NEXTVAL, 'user5', '제이슨', '남', '강원');