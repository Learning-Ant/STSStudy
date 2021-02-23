DROP TABLE BOARD;
CREATE TABLE BOARD (
	BIDX NUMBER PRIMARY KEY,
	BWRITER VARCHAR2(20) NOT NULL,
	BTITLE VARCHAR2(100) NOT NULL,
	BCONTENT VARCHAR2(2000),
	BDATE DATE
);

DROP SEQUENCE BOARD_SEQ;
CREATE SEQUENCE BOARD_SEQ
START WITH 1000
INCREMENT BY 1
MAXVALUE 9999
NOCYCLE
NOCACHE;