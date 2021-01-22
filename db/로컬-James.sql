-- book 리뷰

drop table Comment_t;
drop table purchase_t;
drop table review_t;
drop table qna_t;
drop table goods_t;
drop table book_t;
drop table user_t;

drop SEQUENCE user_seq;
drop SEQUENCE review_seq;
drop SEQUENCE goods_seq;
drop SEQUENCE purchase_seq;
drop SEQUENCE qna_seq;


create table user_t (uIdx number primary key, uName varchar2(20) not null, uId_ varchar2(11) not null unique, uPassword varchar2(20) not null, uPhone varchar2(13) not null unique, uBirthday date, uEmail varchar2(30) not null unique, uAddress varchar2(100) not null, uGenre varchar2(20), uMemberShip varchar2(20) default 'normal' check(uMemberShip in('normal', 'expert', 'master', 'admin')), uPoint number default 0, uAddressDetail varchar2(50), uTotalPoint number default 0, uState number default 1);
create table book_t(bISBN number primary key, bTitle varchar2(150) not null, bWriter varchar2(150) not null, bPublisher varchar2(150) not null, bPubdate date not null, bImage varchar2(200));
create table review_t(rIdx number primary key, uId_ varchar2(11) not null, bISBN number not null, rContent varchar2(400), rGrade number check(rGrade between 0 and 5), rDate date, bTitle varchar2(150) not null, constraint user_t_uId_FK foreign key (uId_) references user_t(uId_), constraint book_t_bISBN_FK foreign key (bISBN) references book_t(bISBN));
create table goods_t(gIdx number primary key, gName varchar2(30) not null, gImage varchar2(100), gQuantity number not null, gPrice number not null, gDate date, gDetail varchar2(500), gState number default 1);
create table purchase_t(pIdx number primary key, uId_ varchar2(11) not null, gIdx number not null, pQuantity number not null, pDate date, constraint user_t_uId_FK2 foreign key(uId_) references user_t(uId_), pReceiver varchar2(20) not null, pPhone varchar2(13) not null, pAddress varchar2(100) not null, pAddressDetail varchar2(50), pMessage varchar2(100), pInvoiceNo varchar2(30), constraint goods_t_gIdx_FK foreign key(gIdx) references goods_t(gIdx));
create table qna_t(qIdx number primary key, qCategory number not null, qTitle varchar2(50) not null,uId_ varchar2(11), qContent varchar2(500) not null, qDate date,qCheck number default 0, constraint user_t_uId_FK3 foreign key (uId_) references user_t(uId_));
create table Comment_t(qIdx number primary key, cContent varchar2(500) not null, cDate date, constraint qna_t_qIdx_FK foreign key(qIdx) references qna_t(qIdx) on delete cascade);

create sequence user_seq;
create sequence review_seq;
create sequence goods_seq;
create sequence purchase_seq;
create sequence qna_seq;

insert into user_t(uIdx, uName, uId_, uPassword, uPhone, uEmail, uAddress, uMemberShip, uPoint, uAddressDetail, uTotalPoint) values(user_seq.nextval, '관리자', 'admin', '123456', '010-1234-5678','admin@email.com', '12345경기도 시흥시 부일로 154번길 17-8', 'admin', 30000, '2층', 50000);

insert into user_t(uIdx, uName, uId_, uPassword, uPhone, uEmail, uAddress, uAddressDetail) values(user_seq.nextval, 'james', 'id02', '222222', '010-2222-2222','id02@email.com', '12345강원도', '2층');

insert into user_t(uIdx, uName, uId_, uPassword, uPhone, uEmail, uAddress, uMemberShip, uPoint, uAddressDetail, uTotalPoint) values(user_seq.nextval, '해커', 'id0x', 'xxxxxx', '010-1234-1111','id0x@email.com', '12345경기도','master', 15000, '2층', 20000);

insert into user_t(uIdx, uName, uId_, uPassword, uPhone, uEmail, uAddress, uAddressDetail) values(user_seq.nextval, 'alice', 'id01', '111111', '010-1111-1111','id01@email.com', '12345경기도', '2층');

insert into user_t values(user_seq.nextval, '테스터01', 'tester01', '111111', '010-1211-1111', to_date('19901010', 'YYYYMMDD'), 'tester01@email.com', '11111경기도 시흥시 1번호 111-11', '문학', 'normal', 0, '1층', 0, 1);

insert into user_t values(user_seq.nextval, '테스터02', 'tester02', '222222', '010-2211-2222', to_date('19950220', 'YYYYMMDD'), 'tester02@email.com', '22222경기도 시흥시 2번호 222-22', '문학', 'normal', 0, '2층', 0, 1);

insert into user_t values(user_seq.nextval, '테스터03', 'tester03', '333333', '010-3311-3333', to_date('19920330', 'YYYYMMDD'), 'tester03@email.com', '33333경기도 시흥시 3번호 332-33', '문학', 'normal', 0, '3층', 0, 1);

insert into user_t values(user_seq.nextval, '테스터04', 'tester04', '444444', '010-4411-4444', to_date('19980730', 'YYYYMMDD'), 'tester04@email.com', '44444경기도 시흥시 4번호 442-44', '문학', 'normal', 0, '4층', 0, 1);

insert into user_t values(user_seq.nextval, '테스터05', 'tester05', '555555', '010-5555-5555', to_date('19900205', 'YYYYMMDD'), 'tester05@email.com', '55555경기도 시흥시 5번호 552-55', '문학', 'master', 18000, '5층', 20000, 1);

insert into user_t values(user_seq.nextval, '테스터06', 'tester06', '666666', '010-6666-6666', to_date('20000206', 'YYYYMMDD'), 'tester06@email.com', '66655경기도 시흥시 6번호 662-66', '문학', 'expert', 4900, '6층', 9900, 1);

insert into user_t values(user_seq.nextval, '테스터07', 'tester07', '777777', '010-7777-7777', to_date('19870707', 'YYYYMMDD'), 'tester07@email.com', '77755경기도 시흥시 7번호 772-77', '문학', 'normal', 2900, '7층', 2900, 1);

insert into user_t values(user_seq.nextval, '테스터08', 'tester08', '888888', '010-8888-8888', to_date('19980808', 'YYYYMMDD'), 'tester08@email.com', '87755강원도 강릉시 7번호 882-77', '문학', 'normal', 2900, '8층', 2900, 1);

insert into user_t values(user_seq.nextval, '테스터09', 'tester09', '999999', '010-9999-9999', to_date('19990909', 'YYYYMMDD'), 'tester09@email.com', '97755강원도 강릉시 7번호 992-77', '문학', 'expert', 7000, '9층', 8000, 1);

insert into user_t values(user_seq.nextval, '테스터10', 'tester10', '111111', '010-1211-1001', to_date('19911110', 'YYYYMMDD'), 'tester10@email.com', '11111경기도 시흥시 1번호 111-11', '문학', 'normal', 0, '1층', 0, 1);

insert into user_t values(user_seq.nextval, '테스터11', 'testerll', '111111', '010-1211-1121', to_date('19911110', 'YYYYMMDD'), 'testerll@email.com', '11541경기도 시흥시 1번호 111-11', '문학', 'normal', 0, '1층', 0, 1);

insert into user_t values(user_seq.nextval, '테스터12', 'testerl2', '222222', '010-2211-2452', to_date('19950220', 'YYYYMMDD'), 'tester12@email.com', '22222경기도 시흥시 2번호 222-22', '문학', 'normal', 0, '2층', 0, 1);

insert into user_t values(user_seq.nextval, '테스터13', 'tester13', '333333', '010-3311-3113', to_date('19920330', 'YYYYMMDD'), 'tester13@email.com', '33333경기도 시흥시 3번호 332-33', '문학', 'normal', 0, '3층', 0, 1);

insert into user_t values(user_seq.nextval, '테스터14', 'tester14', '444444', '010-4411-4234', to_date('19980730', 'YYYYMMDD'), 'tester14@email.com', '44444경기도 시흥시 4번호 442-44', '비문학', 'master', 14000, '4층', 15000, 1);

insert into user_t values(user_seq.nextval, '테스터15', 'tester15', '555555', '010-5555-4522', to_date('19900205', 'YYYYMMDD'), 'tester15@email.com', '55555경기도 시흥시 5번호 552-55', '문학', 'master', 18000, '5층', 20100, 1);

insert into user_t values(user_seq.nextval, '테스터16', 'tester16', '666666', '010-6666-1111', to_date('20010216', 'YYYYMMDD'), 'tester16@email.com', '66655경기도 시흥시 6번호 662-66', '문학', 'expert', 4900, '6층', 9900, 1);

insert into user_t values(user_seq.nextval, '테스터17', 'tester17', '777777', '010-7777-2222', to_date('19870707', 'YYYYMMDD'), 'tester17@email.com', '77755경기도 시흥시 7번호 772-77', '문학', 'normal', 2900, '7층', 2900, 1);

insert into user_t values(user_seq.nextval, '테스터18', 'tester18', '888888', '010-1388-3333', to_date('19980808', 'YYYYMMDD'), 'tester18@email.com', '87755강원도 강릉시 7번호 882-77', '문학', 'normal', 2900, '8층', 2900, 1);

insert into user_t values(user_seq.nextval, '테스터19', 'tester19', '999999', '010-9999-4444', to_date('19990919', 'YYYYMMDD'), 'tester19@email.com', '97755강원도 강릉시 7번호 992-77', '문학', 'expert', 7000, '9층', 8000, 1);

insert into user_t values(user_seq.nextval, '관리자', 'admin01', 'tester123*', '010-4899-0587', to_date('19950105', 'YYYYMMDD'), 'othleewon@gmail.com', '12345인천광역시 중구 무슨로111번길 무슨아파트', '문학', 'admin', 1000, '101동 102호', 1000, '1');

insert into user_t values(user_seq.nextval, '테스터20', 'tester20', '202020', '010-2099-4444', to_date('19990920', 'YYYYMMDD'), 'tester20@email.com', '97755강원도 강릉시 7번호 992-77', '문학', 'normal', 3000, '9층', 3000, 1);

insert into user_t values(user_seq.nextval, '테스터21', 'tester21', '212121', '010-2111-4444', to_date('19920920', 'YYYYMMDD'), 'tester21@email.com', '97755강원도 강릉시 7번호 992-77', '문학', 'normal', 2900, '9층', 2900, 0);

insert into book_t(bISBN, bTitle, bWriter, bPublisher, bPubdate) values(9791189581411, '군주론', '마키아벨리', '더클래식', to_date('20181013', 'YYYYMMDD'));

insert into book_t(bISBN, bTitle, bWriter, bPublisher, bPubdate) values(9788952768568, '책 읽어주는 남자', '베른하르트 슐링크', '시공사' , to_date('20130325', 'YYYYMMDD'));

insert into book_t(bISBN, bTitle, bWriter, bPublisher, bPubdate) values(9788983925008, '다빈치 코드1', '댄 브라운', '문학수첩', to_date('20131211', 'YYYYMMDD'));

insert into book_t(bISBN, bTitle, bWriter, bPublisher, bPubdate) values(9788983925015, '다빈치 코드2', '댄 브라운', '문학수첩', to_date('20131211', 'YYYYMMDD'));

insert into book_t(bISBN, bTitle, bWriter, bPublisher, bPubdate) values(9788936433598, '채식주의자', '한강', '창비', to_date('20071030', 'YYYYMMDD'));

insert into book_t(bISBN, bTitle, bWriter, bPublisher, bPubdate) values(9788983711892, '코스모스', '칼 세이건', '사이언스북스', to_date('20061220', 'YYYYMMDD'));

insert into book_t(bISBN, bTitle, bWriter, bPublisher, bPubdate) values(9788962630619, '침묵의 봄', '레이첼 카슨', '에코리브르', to_date('20111230', 'YYYYMMDD'));

insert into book_t(bISBN, bTitle, bWriter, bPublisher, bPubdate) values(9788982814471, '연금술사', '파울로 코엘료', '문학동네', to_date('20011201', 'YYYYMMDD'));

insert into book_t(bISBN, bTitle, bWriter, bPublisher, bPubdate) values(9788932903507, '개미1', '베르나르 베르베르', '열린책들', to_date('20010130', 'YYYYMMDD'));

insert into book_t(bISBN, bTitle, bWriter, bPublisher, bPubdate) values(9788956604992, '7년의 밤', '정유정', '은행나무', to_date('20110323', 'YYYYMMDD'));

insert into review_t values(review_seq.nextval, 'id01', 9791189581411, 'test01', 4, to_date('2020-02-07', 'YYYY-MM-DD'), '군주론');

insert into review_t values(review_seq.nextval, 'tester01', 9788952768568, '테스트02', 5,  to_date('2020-02-07', 'YYYY-MM-DD'), '책 읽어주는 남자');

insert into review_t values(review_seq.nextval, 'id02', 9788983925008, '정말 재미있습니다. 댄 브라운은 믿고 보는 작가에요', 5, to_date('2020-02-09', 'YYYY-MM-DD'), '다빈치 코드1');

insert into review_t values(review_seq.nextval, 'testerll', 9788983925015, '테스트04', 4, to_date('2020-02-09', 'YYYY-MM-DD'), '다빈치 코드2');

insert into review_t values(review_seq.nextval, 'tester03', 9791189581411, 'test05', 3, to_date('2020-02-07', 'YYYY-MM-DD'), '군주론');

insert into review_t values(review_seq.nextval, 'id02', 9788936433598, '솔직히 이해하기 힘들었습니다. 감정선이 무거운 편이라 저는 읽기 힘들었네요', 2, to_date('2020-02-09', 'YYYY-MM-DD'), '채식주의자');

insert into review_t values(review_seq.nextval, 'tester02', 9788952768568, '상당한 의문을 남겨주는 작품입니다. 그 답은 자신이 내야한다는 점에서 추천하고 싶네요.', 5,  to_date('2020-02-07', 'YYYY-MM-DD'), '책 읽어주는 남자');

insert into review_t values(review_seq.nextval, 'tester05', 9788983925015, 'test08', 1, to_date('2020-02-10', 'YYYY-MM-DD'), '다빈치 코드2');

insert into review_t values(review_seq.nextval, 'tester06', 9788983925015, '테스트09', 5,  to_date('2020-02-10', 'YYYY-MM-DD'), '다빈치 코드2');

insert into review_t values(review_seq.nextval, 'tester03', 9788983925008, 'test10', 3,  to_date('2020-02-09', 'YYYY-MM-DD'), '다빈치 코드1');

insert into review_t values(review_seq.nextval, 'id01', 9791189581411, '정치인을 이해하기 싫지만, 선거철마다 저러는 행동에 의문이 들때 그 의문을 해소시켜 줄껍니다.', 4,  to_date('2020-02-10', 'YYYY-MM-DD'), '군주론');

insert into review_t values(review_seq.nextval, 'tester01', 9788952768568, '테스트12', 3,  to_date('2020-02-10', 'YYYY-MM-DD'), '책 읽어주는 남자');

insert into review_t values(review_seq.nextval, 'id02', 9788952768568, 'test13', 5,  to_date('2020-02-11', 'YYYY-MM-DD'), '책 읽어주는 남자');

insert into review_t values(review_seq.nextval, 'testerll', 9788983925015, '재미있네요.', 4,  to_date('2020-02-11', 'YYYY-MM-DD'), '다빈치 코드2');

insert into review_t values(review_seq.nextval, 'tester03', 9788952768568, 'test15', 3,  to_date('2020-02-11', 'YYYY-MM-DD'), '책 읽어주는 남자');

insert into review_t values(review_seq.nextval, 'id02', 9788936433598, '어려워요....', 2,  to_date('2020-02-11', 'YYYY-MM-DD'), '채식주의자');

insert into review_t values(review_seq.nextval, 'tester02', 9788952768568, '테스트17', 5,  to_date('2020-02-11', 'YYYY-MM-DD'), '책 읽어주는 남자');

insert into review_t values(review_seq.nextval, 'tester05', 9791189581411, '윽...어려워', 1, to_date('2020-02-11', 'YYYY-MM-DD'), '군주론');

insert into review_t values(review_seq.nextval, 'tester06', 9788983925015, '테스트19', 3,  to_date('2020-02-12', 'YYYY-MM-DD'), '다빈치 코드2');

insert into review_t values(review_seq.nextval, 'tester03', 9788936433598, '휘몰아 치는 감정선에 천천히 여러번 읽어봐야하더군요. 하지만 개인적으로 이런 감정소모를 깊게 해야하는 책은 힘들어서 추천하기는 좀....', 3,  to_date('2020-02-12', 'YYYY-MM-DD'), '채식주의자');

insert into review_t values(review_seq.nextval, 'tester07', 9788983925015, '재미있네요22.', 4,  to_date('2020-02-12', 'YYYY-MM-DD'), '다빈치 코드2');

insert into review_t values(review_seq.nextval, 'tester02', 9791189581411, '리더와 군주는 다르다는걸 알게 해주는 책', 5,  to_date('2020-02-12', 'YYYY-MM-DD'), '군주론');

insert into review_t values(review_seq.nextval, 'tester08', 9791189581411, 'TV프로그램에 나와서 봤는데, 그래도 어려운 책이네요', 3, to_date('2020-02-13', 'YYYY-MM-DD'), '군주론');

insert into review_t values(review_seq.nextval, 'tester20', 9788983711892, '노잼', 1, to_date('2020-02-08 13:25:23', 'YYYY-MM-DD HH24:MI:SS'), '코스모스');

insert into review_t values(review_seq.nextval, 'tester15', 9791189581411, '정치쪽이라 그런지 어렵긴 하네요. 하지만 그래도 읽어볼만한 가치가 있다고 생각합니다', 5, to_date('2020-02-12 17:15:24', 'YYYY-MM-DD HH24:MI:SS'), '군주론');

insert into review_t values(review_seq.nextval, 'tester07', 9788962630619, '저는 이거 문학일줄 알았는데, 과학관련이네요;;;', 2, to_date('2020-02-08 15:25:23', 'YYYY-MM-DD HH24:MI:SS'), '침묵의 봄');

insert into review_t values(review_seq.nextval, 'tester08', 9788982814471, '믿고 보는 파울로 코엘료', 5, to_date('2020-02-09 18:27:50', 'YYYY-MM-DD HH24:MI:SS'), '연금술사');

insert into review_t values(review_seq.nextval, 'tester09', 9788932903507, '책 권수가 많은데도 1권 읽고 빠져버렸다. 새로운 시각을 느끼고 싶다면 추천', 5, to_date('2020-02-11 10:22:30', 'YYYY-MM-DD HH24:MI:SS'), '개미1');

insert into review_t values(review_seq.nextval, 'tester09', 9788956604992, '와...아...아... 이건 읽어봐야합니다. 흔한 추리소설이 아니에요.', 4, to_date('2020-02-12 17:22:30', 'YYYY-MM-DD HH24:MI:SS'), '7년의 밤');

insert into review_t values(review_seq.nextval, 'tester15', 9788983711892, '우주 덕후라면 한번은 읽어보라고 하고 싶은 책.', 2, to_date('2020-02-07 15:12:24', 'YYYY-MM-DD HH24:MI:SS'), '코스모스');

insert into review_t values(review_seq.nextval, 'tester16', 9788982814471, '파울로 코엘료라는 작가한테 푹 빠지게 만든 책', 5, to_date('2020-02-12 13:11:14', 'YYYY-MM-DD HH24:MI:SS'), '연금술사');

insert into review_t values(review_seq.nextval, 'tester19', 9788982814471, '음...사람들이 극찬하는 이유를 모르겠다. 그냥 작가 네임드에 거품낀듯함', 2, to_date('2020-02-12 12:01:11', 'YYYY-MM-DD HH24:MI:SS'), '연금술사');

insert into review_t values(review_seq.nextval, 'tester17', 9788962630619, '살충제 하나로 너무 끔직한 미래가 펼쳐지는듯 함. 과대해석 아닌가?', 2, to_date('2020-02-12 13:11:11', 'YYYY-MM-DD HH24:MI:SS'), '침묵의 봄');

insert into review_t values(review_seq.nextval, 'id01', 9788982814471, 'ㅎㅎ재미있어요', 4, to_date('2020-02-13 12:13:11', 'YYYY-MM-DD HH24:MI:SS'), '연금술사');

insert into review_t values(review_seq.nextval, 'id02', 9788932903507, '추천드려요', 5, to_date('2020-02-13 11:24:17', 'YYYY-MM-DD HH24:MI:SS'), '개미1');

insert into review_t values(review_seq.nextval, 'id01', 9788956604992, '전 이거 별로...', 2, to_date('2020-02-13 10:13:11', 'YYYY-MM-DD HH24:MI:SS'), '7년의 밤');

insert into review_t values(review_seq.nextval, 'id0x', 9791189581411, 'xxx', 2, to_date('2020-02-13 01:11:11', 'YYYY-MM-DD HH24:MI:SS'), '군주론');

insert into review_t values(review_seq.nextval, 'id0x', 9788952768568, 'xxx', 2, to_date('2020-02-13 01:11:11', 'YYYY-MM-DD HH24:MI:SS'), '책 읽어주는 남자');

insert into review_t values(review_seq.nextval, 'id0x', 9788983925008, 'xxx', 2, to_date('2020-02-13 01:11:11', 'YYYY-MM-DD HH24:MI:SS'), '다빈치 코드1');

insert into review_t values(review_seq.nextval, 'id0x', 9788983925015, 'xxx', 2, to_date('2020-02-13 01:11:11', 'YYYY-MM-DD HH24:MI:SS'), '다빈치 코드2');

insert into review_t values(review_seq.nextval, 'id0x', 9788936433598, 'xxx', 2, to_date('2020-02-13 01:11:11', 'YYYY-MM-DD HH24:MI:SS'), '채식주의자');

insert into review_t values(review_seq.nextval, 'id0x', 9788983711892, 'xxx', 2, to_date('2020-02-13 01:11:11', 'YYYY-MM-DD HH24:MI:SS'), '코스모스');

insert into review_t values(review_seq.nextval, 'id0x', 9788962630619, 'xxx', 2, to_date('2020-02-13 01:11:11', 'YYYY-MM-DD HH24:MI:SS'), '침묵의 봄');

insert into review_t values(review_seq.nextval, 'id0x', 9788982814471, 'xxx', 2, to_date('2020-02-13 01:11:11', 'YYYY-MM-DD HH24:MI:SS'), '연금술사');

insert into review_t values(review_seq.nextval, 'id0x', 9788932903507, 'xxx', 2, to_date('2020-02-13 01:11:11', 'YYYY-MM-DD HH24:MI:SS'), '개미1');

insert into review_t values(review_seq.nextval, 'id0x', 9788956604992, 'xxx', 2, to_date('2020-02-13 01:11:11', 'YYYY-MM-DD HH24:MI:SS'), '7년의 밤');

insert into qna_t values( qna_seq.nextval , 1, '배송관련 공지사항입니다.' , 'admin', '공지사항이에요', sysdate, 0 );

insert into qna_t values( qna_seq.nextval , 2, '배송이 안와요 !!!', 'tester20', '배송이 3일째 안오는데 잘못된건가요??? ' , to_date('2020-02-11','YYYY-MM-DD'), 0 );

insert into qna_t values( qna_seq.nextval , 3, '상품상세볼때 오류가 나요! ', 'tester21', '자꾸 이상한 에러가 나요!! ' , sysdate, 0 );

commit;