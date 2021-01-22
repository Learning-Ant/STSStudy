-- 도시락 판매

DROP TABLE REVIEW; 
DROP TABLE NOTICE;
DROP TABLE FAQ;
DROP TABLE PRODUCT;
DROP TABLE MEMBER;
DROP TABLE CART;

DROP SEQUENCE REVIEW_SEQ;
DROP SEQUENCE NOTICE_SEQ;
DROP SEQUENCE FAQ_SEQ;
DROP SEQUENCE PRODUCT_SEQ;
DROP SEQUENCE CART_SEQ;
DROP SEQUENCE ORDER_BASE_SEQ;


CREATE TABLE REVIEW (
 RE_NO NUMBER NOT NULL,
 RE_ID VARCHAR2(100) NOT NULL,
 RE_PRODUCT_NAME VARCHAR2(100) NOT NULL,
 RE_CONTENT VARCHAR2(500) NOT NULL,
 RE_PW VARCHAR2(100) NOT NULL,
 RE_SCORE VARCHAR2(100) NOT NULL,
 RE_DATE DATE NOT NULL, 
 RE_IMG VARCHAR2(100),
 RE_THUMBIMG VARCHAR2(100) );
 
CREATE TABLE NOTICE (
 NOTICE_NO NUMBER NOT NULL,
 NOTICE_TITLE VARCHAR2(100) NOT NULL,
 NOTICE_CONTENT VARCHAR2(500) NOT NULL,
 NOTICE_DATE DATE NOT NULL,
 NOTICE_IMG VARCHAR2(200) );
 
CREATE TABLE FAQ (
 FAQ_NO NUMBER NOT NULL,
 FAQ_TITLE VARCHAR2(1000) NOT NULL,
 FAQ_CONTENT VARCHAR2(1000) NOT NULL,
 FAQ_CATEGORY VARCHAR2(100) NOT NULL ); 

CREATE TABLE PRODUCT (
 PRODUCT_NO NUMBER NOT NULL PRIMARY KEY, 
 PRODUCT_NAME VARCHAR2(1000) NOT NULL, 
 PRODUCT_PRICE VARCHAR2(20) NOT NULL, 
 PRODUCT_CONTENT VARCHAR2(1000) NOT NULL, 
 PRODUCT_STOCK VARCHAR2(20) NOT NULL, 
 PRODUCT_TASTE VARCHAR2(20) NOT NULL,
 PRODUCT_IMG VARCHAR2(200), 
 PRODUCT_THUMBIMG VARCHAR2(200) );

CREATE TABLE MEMBER ( 
 ID VARCHAR2(20) NOT NULL PRIMARY KEY, 
 PW VARCHAR2(20) NOT NULL,
 NAME VARCHAR2(20) NOT NULL,
 PHONE VARCHAR2(20) NOT NULL,
 EMAIL VARCHAR2(20) NOT NULL,
 BIRTH VARCHAR2(20) NOT NULL,
 POST VARCHAR2(20) NOT NULL,
 ROAD VARCHAR2(50) NOT NULL,
 REG_DATE DATE NOT NULL,
 ROLE VARCHAR2(20) DEFAULT 'USER' NOT NULL );

CREATE TABLE CART ( 
 CART_NO NUMBER NOT NULL PRIMARY KEY,
 ORDER_NO NUMBER,
 CART_ID VARCHAR2(200) NULL, 
 PRODUCT_NO NUMBER NULL, 
 CART_AMOUNT NUMBER DEFAULT 0 );

CREATE TABLE ORDER_BASE (
 ORDER_NO NUMBER PRIMARY KEY, 
 GUEST_PW VARCHAR2(20), 
 ORDER_NAME VARCHAR2(10), 
 ORDER_PHONE VARCHAR2(10),
 ORDER_PHONE2 VARCHAR2(10),
 ORDER_PHONE3 VARCHAR2(10),
 ORDER_EMAIL VARCHAR2(20), 
 ORDER_EMAIL2 VARCHAR2(20),
 DELIVERY_NAME VARCHAR2(20),
 DELIVERY_PHONE VARCHAR2(20),
 DELIVERY_PHONE2 VARCHAR2(20),
 DELIVERY_PHONE3 VARCHAR2(20),
 ORDER_POST VARCHAR2(20), 
 ORDER_ROAD1 VARCHAR2(50),
 ORDERDATE DATE DEFAULT SYSDATE );

CREATE SEQUENCE REVIEW_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE NOTICE_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE FAQ_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE PRODUCT_SEQ START WITH 5002215 INCREMENT BY 1;
CREATE SEQUENCE CART_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE ORDER_BASE_SEQ START WITH 1 INCREMENT BY 1;



insert into faq (faq_no,faq_title,faq_content,faq_category) values
(faq_seq.nextval, '회원 아이디, 비밀번호를 잊어버린 경우 어떻게 찾을 수 있나요? ','로그인 페이지에서 아이디/비밀번호 찾기를 통해 확인 가능합니다.
간편 로그인의 아이디/비밀번호를 잊으셨다면, 해당 SNS(카카오톡,네이버,페이스북) 사이트에서
아이디/비밀번호를 확인하실 수 있습니다.','member');

insert into faq (faq_no,faq_title,faq_content,faq_category) values
(faq_seq.nextval,'비회원으로 주문할 수 있나요?','네, 비회원도 주문 가능합니다.','member');

insert into faq (faq_no,faq_title,faq_content,faq_category) values
(faq_seq.nextval,'회원가입에 나이제한이 있나요?','전자상거래 법에 의거하여 만 14세 이상의 고객님만 서비스 이용이 가능합니다.','member');

insert into faq (faq_no,faq_title,faq_content,faq_category) values
(faq_seq.nextval,'회원정보 변경은 어떻게 하나요?','회원정보 중 이름(개명 시), 휴대전화 번호, 이메일은
푸딧 사이트에서 변경하실 수 있습니다.','member');

insert into faq (faq_no,faq_title,faq_content,faq_category) values
(faq_seq.nextval,'회원가입은 어떻게 하나요?','회원가입은 로그인 메뉴에서 가능합니다.','member');

insert into faq (faq_no,faq_title,faq_content,faq_category) values
(faq_seq.nextval,'자택이 아닌 다른 곳으로도 배송이 가능한가요','FOODIT은 새벽에 배송되어 새벽 출입이 제한되는 회사, 관공서, 상가, 학교, 기숙사, 병원, 시장 등은 배송이 불가합니다.','delievery';

insert into faq (faq_no,faq_title,faq_content,faq_category) values
(faq_seq.nextval,'해외에 거주하는 사람도 배송받을 수 있나요?','FOODIT은 서울, 경기, 인천 지역(일부지역 제외)에만 새벽 배송되고 있으며,신선 식품으로 해외 배송은 불가합니다.','delievery');

insert into faq (faq_no,faq_title,faq_content,faq_category) values
(faq_seq.nextval,'배송시간을 선택할 수 있나요?','배송 시간은 선택 불가합니다. 쿡킷의 모든 메뉴는 주문 시 선택한 배송일에 새벽(아침 7시전) 배송 됩니다. 다만, 교통상황 및 기상에 따라 배송이 지연될 수 있습니다. 양해 부탁드립니다.','delievery');

insert into faq (faq_no,faq_title,faq_content,faq_category) values
(faq_seq.nextval,'주문하면 며칠 후에 배송받을 수 있나요? ','요리가 필요한 날! 새벽 수산시장, 프리미엄 마켓을 가지 않아도 신선하게 손질된 재료가 우리집 앞에! 주문한 메뉴가 언제 배달될까 기다리지 마세요! 푸딧 내가 원하는 날, 새벽에 배송해 드립니다.','delievery');

insert into faq (faq_no,faq_title,faq_content,faq_category) values
(faq_seq.nextval,'공동현관 비밀번호를 꼭 적어야 하나요?','푸딧은 고객님과 연락이 어려운 새벽(아침 7시전)에
배송되기 때문에 안전한 배송을 위해 고객님의 집 앞으로 배송하며, 고객님의 집 앞으로 배송하기 위해 공동현관인 경우 비밀번호를 기재해 주셔야 합니다.','delievery');

insert into faq (faq_no,faq_title,faq_content,faq_category) values
(faq_seq.nextval,'세금계산서는 어떻게 신청하나요?','세금계산서는 현금 및 법인카드 결제에 한해 발행됩니다','payment');



insert into faq (faq_no,faq_title,faq_content,faq_category) values
(faq_seq.nextval,'무통장 입금으로 결제를 할 수 있나요?','COOKIT은 한정된 수량을 고객님이 지정한 배송일에 배송하는 제품으로 주문 시간과 입금시간이 다를 경우, 품절이 발생할 수 있어 무통장 입금은 불가합니다.','payment');

insert into faq (faq_no,faq_title,faq_content,faq_category) values
(faq_seq.nextval,'메뉴의 유통기한이 어떻게 되나요? ','FOODIT은 신선한 원물을 바로 조리해서 드실 수 있도록 손질해서 보내드리고 있습니다. 배송 받은 즉시 냉장/냉동 보관해 주시고, 배송 받은 날로부터 3일 이내 조리해 드시는 것을 권장 드립니다.','order');


insert into faq (faq_no,faq_title,faq_content,faq_category) values
(faq_seq.nextval,'주문 내역은 어디서 확인하나요? ','주문한 내역은 [MY쿡킷>주문/배송조회] 에서 확인하실 수 있습니다.','order');


insert into faq (faq_no,faq_title,faq_content,faq_category) values
(faq_seq.nextval,'한 번에 구매할 수 있는 수량에 제한이 있나요? ','일반적으로 구매 수량 제한은 없으나,유통기한을 고려하여 한번에 2-3개 구매하시는 것을 권장드립니다.','order');


insert into faq (faq_no,faq_title,faq_content,faq_category) values
(faq_seq.nextval,'주문마감시간은 언제인가요?','FOODIT의 주문 마감 시간은 평일 오전 7시입니다. 매일 주문 마감 후 신선한 재료를 준비하며,늦은 저녁 출발하여 지정한 배송일 새벽에 받아보실 수 있도록 배송합니다.','order');


insert into faq (faq_no,faq_title,faq_content,faq_category) values
(faq_seq.nextval,'반품 신청은 어떻게 하나요?','FOODIT은 냉장ㆍ냉동ㆍ신선식품으로 시간이 경과하면 상품의 가치가 훼손되기 쉬우므로 제품 하자 이외의 고객님의 단순 변심으로 인한 반품 신청은 불가합니다. 제품 수령 시 하자가 없는지 꼭 확인해 주시기 바랍니다.','ret');



insert into faq (faq_no,faq_title,faq_content,faq_category) values
(faq_seq.nextval,'반품 접수 하지않고, 수취거부하거나 상품을 직접 보내도 되나요?','반품 접수 없이 임의로 반송하거나, 수취거부하는 경우 식품의 특성상 하자 상태를 확인하기 어려우므로 환불이 불가합니다.','ret');


insert into faq (faq_no,faq_title,faq_content,faq_category) values
(faq_seq.nextval,'반품했는데 환불은 언제 되나요?','반품된 상품이 물류센터로 입고되어 검수가 완료되면 "반품완료" 처리됩니다. 환불은 반품완료 후 처리되며, 결제수단에 따라 소요 기간이 상이할 수 있습니다.','ret');


insert into faq (faq_no,faq_title,faq_content,faq_category) values
(faq_seq.nextval,'상품의 교환이 가능한가요?','FOODIT은 한정 수량 판매 방식으로 교환 시 품절이 발생할 수 있으며, 냉장ㆍ냉동ㆍ신선식품으로 변질의 우려가 있어 교환은 불가합니다.','ret');


insert into faq (faq_no,faq_title,faq_content,faq_category) values
(faq_seq.nextval,'이전에 판매했던 메뉴의 정보를 보고싶어요','푸딧은 제철 재료의 수급과 다양한 집밥의 즐거움을 위해, 한정된 기간동안만 메뉴를 판매합니다, 그렇기 때문에 다시 정보를 보실 수는 없습니다.','etc');




insert into faq (faq_no,faq_title,faq_content,faq_category) values
(faq_seq.nextval,'보냉제는 100% 물인가요?','쿡킷은 지구를 위한 첫 걸음으로 아이스팩에 화학제품을 넣지 않고,100퍼센트 물을 넣어 사용하고 있습니다.','etc');


insert into faq (faq_no,faq_title,faq_content,faq_category) values
(faq_seq.nextval,'배송된 재료는 세척해서 사용해야 하나요?','야채는 전해수로 세척하여 손질하기 때문에 조리 시 다시 세척하지 않으셔도 됩니다.','etc');

insert into notice (notice_no, notice_title, notice_content, notice_date, notice_img) values (notice_seq.nextval, '미리보는 푸딧 전체 메뉴 (2月)', ' 메뉴는 원물 준비사항에 따라 변동될 수 있습니다. 신메뉴는 월요일, 목요일 오전10시에 오픈됩니다. ', sysdate, null); 


insert into notice (notice_no, notice_title, notice_content, notice_date, notice_img) values (notice_seq.nextval, '미리보는 푸딧 전체 메뉴 (1月)', ' 메뉴는 원물 준비사항에 따라 변동될 수 있습니다.
※ 신메뉴는 "월요일, 목요일" 오전10시에 오픈됩니다. ', sysdate, null);

insert into notice (notice_no, notice_title, notice_content, notice_date, notice_img) values (notice_seq.nextval, '개인정보처리방침 내용 변경 고지 2020.2.4 시행', '안녕하세요. 푸딧입니다.푸딧 홈페이지의 「개인정보처리방침」이 2020년 2월 4일자로 변경될 예정입니다.
아래 변경된 개인정보처리방침의 내용을 확인하시어 푸딧㈜이 운영하는 푸딧 이용에 불편함 없으시길 바랍니다.', sysdate, null);

insert into notice (notice_no, notice_title, notice_content, notice_date, notice_img) values (notice_seq.nextval, '연말/신년 배송 휴무일 안내', '배송 휴무일  크리스마스-12/26목, 신정연휴 - 1/2()
', sysdate, null);

insert into notice (notice_no, notice_title, notice_content, notice_date, notice_img) values (notice_seq.nextval, '가락시장 신정 연휴로 인한 미운영 상품 안내', '사유 : 가락시장 1/1(수)~2(목) 신년 연휴로 인하여 일부 농산물 수급 불가
- 해당기간 미운영 대상 상품 : 부추가득 오리불고기  /  눈치닭  /  남한산성식 닭볶음탕  /  김치가츠나베 사이트 이용에 불편을 드려 죄송합니다.푸딧 담당자 드림 ', sysdate, null);

insert into notice (notice_no, notice_title, notice_content, notice_date, notice_img) values (notice_seq.nextval, '사이트점검으로 인한 주문취소 불가 안내드립니다 (8/17~18)', '안녕하세요
푸딧 담당자입니다.
사이트 점검으로 인한 주문취소 불가 안내 드립니다. 
사이트 이용에 불편을 드려 죄송합니다.
 일정 : 8/17(토) 21:00 ~ 8/18(일) 06:00', sysdate, null);

insert into notice (notice_no, notice_title, notice_content, notice_date, notice_img) values (notice_seq.nextval, '쿡킷 이메일 시스템 점검 안내2.13(목)12:30~20:30', '안녕하세요.
푸딧담당자입니다.
보다 나은 서비스 제공을 위해 아래와 같이 이메일 시스템 점검이 진행될 예정입니다.
해당 점검 시간에는 푸딧 이메일이 미발송 되오니 고객님의 너그러운 양해 부탁드립니다.  
감사합니다.', sysdate, null);

insert into notice (notice_no, notice_title, notice_content, notice_date, notice_img) values (notice_seq.nextval, '설렘쿠폰! 설 선물세트 사면 1,000명에게 경품을 드립니다.', '안녕하세요 CJ더마켓담당자입니다. 지난 1/9일부터 1/22일까지 진행되었던, 설 선물세트 설렘쿠폰! 선물세트 사고 경품받자 당첨자 안내드립니다.
당첨을 모두 축하드립니다! 변경 부탁드립니다.', sysdate, null);

Insert into review(re_no, re_date, re_id, re_product_name, re_content, re_pw, re_score, 
re_img) values (1313, sysdate, 'kimya', '레드퀴노아 갈릭 닭가슴살 볶음밥', '너무 맛있게 잘먹었습니다~ 재구매 의사 100%!', '1313', '1', null); 

Insert into review(re_no, re_date, re_id, re_product_name, re_content, re_pw, re_score, 
re_img) values (1313, sysdate, 'kimya', '매콤 닭가슴살 야채 볶음밥', '너무 맛있게 잘먹었습니다~ 재구매 의사 50%!', '1313', '3', null);

Insert into review(re_no, re_date, re_id, re_product_name, re_content, re_pw, re_score, 
re_img) values (1313, sysdate, 'admin', '매콤 닭가슴살 야채 볶음밥', '관리자도 사먹었습니다, 재구매 의사 70%!', '1ㄹ313', '5', null);

Insert into review(re_no, re_date, re_id, re_product_name, re_content, re_pw, re_score, 
re_img) values (1313, sysdate, 'parkway', '다섯가지 야채 새우 볶음밥', '야채가 다양하게 들어가 있어서 좋았습니다!', '1313', '4', null); 

Insert into review(re_no, re_date, re_id, re_product_name, re_content, re_pw, re_score, 
re_img) values (1313, sysdate, 'admin', '매콤야채 빅볼 닭가슴살', '닭가슴살이 질리지도 않고 맛있습니다.', '1313', '2', null);

Insert into review(re_no, re_date, re_id, re_product_name, re_content, re_pw, re_score, 
re_img) values (1313, sysdate, 'kimya', '레드퀴노아 갈릭 닭가슴살 볶음밥', '너무 맛있게 잘먹었습니다~ 재구매 의사…', '1313', '4', null);


Insert into review(re_no, re_date, re_id, re_product_name, re_content, re_pw, re_score, 
re_img) values (1313, sysdate, 'kimya', '무청시래기 표고버섯 솥밥', '여러가지 한 번에 구매해서 먹고 있어요~', '1313', '5', null);

Insert into review(re_no, re_date, re_id, re_product_name, re_content, re_pw, re_score, 
re_img) values (1313, sysdate, 'hello', '레드퀴노아 갈릭 닭가슴살 볶음밥', '간이 조금 싱겁네요..', '1313', '2', null);

insert into member (ID,PW,NAME,PHONE,EMAIL,BIRTH,POST,ROAD,REG_DATE,ROLE) values ('admin','1111','관리자','010-1111-1111','admin@home.com','19951218', 'seoul','sinchonro',sysdate,'admin'); 
insert into member (ID,PW,NAME,PHONE,EMAIL,BIRTH,POST,ROAD,REG_DATE,ROLE) values ('fooditgood','1111','이푸딧','010-1111-1111','foodit1@home.com','19951217', '12345','서울시 마포구 신촌로 12',sysdate,'member');  

insert into member (ID,PW,NAME,PHONE,EMAIL,BIRTH,POST,ROAD,REG_DATE,ROLE) values ('fooditho','1111','박푸딧','010-1111-1111','foodit2@home.com','19951217', '13245','서울시 마포구 성산동 14',sysdate,'member');  

insert into member (ID,PW,NAME,PHONE,EMAIL,BIRTH,POST,ROAD,REG_DATE,ROLE) values ('southkaka','1111','허남형','010-1111-1111','foodit3@home.com','19951219', '15243','서울시 마포구 성산로 431',sysdate,'member');  

insert into member (ID,PW,NAME,PHONE,EMAIL,BIRTH,POST,ROAD,REG_DATE,ROLE) values ('aycaramba1212','1111','남지욘','010-1111-1111','foodit4@home.com','19951221', '16783','서울시 마포구 신촌로 6',sysdate,'member');

insert into member (ID,PW,NAME,PHONE,EMAIL,BIRTH,POST,ROAD,REG_DATE,ROLE) values ('aycaramba1334','1111','남구구','010-1111-1111','foodit5@home.com','19951224', '16785','서울시 마포구 구촌로 67',sysdate,'member'); 

commit;
SET DEFINE OFF;
insert into product values (product_seq.nextval, '갈비맛 빅볼 닭가슴살', 35400, '균형잡힌 구성으로 제대로 된 한끼!', '300', 'salty', null, null);
insert into product values (product_seq.nextval, '레드퀴노아 갈릭 닭가슴살 볶음밥', 39200, '퀴노아,갈릭 닭가슴살 듬뿍', '320', 'salty',null, null);
insert into product values (product_seq.nextval, '어니언 톡톡 콘샐러드', 22200, '입안 가득 상큼톡톡', '330', 'fresh',null, null);
insert into product values (product_seq.nextval, '매콤 닭가슴살 야채 볶음밥', 39200, '부드러운 오믈렛과 함께', '500', 'spicy', null, null);
insert into product values (product_seq.nextval, '갈릭 케이준 치킨 샐러드', 32400, 'with 홀그레인 머스타드 드레싱', '290', 'spicy',null, null);
insert into product values (product_seq.nextval, '코코넛 닭가슴살 커리', 39200, '코코넛 커리로 특별하게', '200', 'exotic', null, null);
insert into product values (product_seq.nextval, '리얼 쉬림프 샐러드', 32400, 'with 레몬 갈릭드레싱', '340', 'exotic',null, null);
insert into product values (product_seq.nextval, '버섯듬뿍 닭가슴살 스테이크', 36400, '언제 어디서든 고급스럽게 ', '250', 'plain',null, null);
insert into product values (product_seq.nextval, '다섯가지 야채 새우 볶음밥', 35400, '새우, 닭가슴살, 야채 듬뿍', '380', 'plain',null, null);
insert into product values (product_seq.nextval, '통단호박 크랜베리 콕콕 샐러드', 22200, '단호박 고유의 맛을 그대로', '280', 'fresh',null, null);
insert into product values (product_seq.nextval, '삼색나물 단호박솥밥', 39200, '담백하고 고소한 별미 도시락', '123', 'plain',null, null);
insert into product values (product_seq.nextval, '매콤 닭가슴살 불고기맛 스테이크', 39200, '고소한 취나물 곤약밥과 함께', '480', 'spicy',null, null);
insert into product values (product_seq.nextval, '롤치즈 토핑샐러드', 32400, 'with 이탈리안 드레싱', '350', 'salty',null, null);
insert into product values (product_seq.nextval, '크랜베리 견과 샐러드 ', 19600, '크랜베리,아몬드,땅콩 듬뿍', '360', 'fresh',null, null);
insert into product values (product_seq.nextval, '토마토소스 닭가슴살 계란볶음밥', 35400, '계란 야채 볶음밥과 함께', '450', 'exotic',null, null);
insert into product values (product_seq.nextval, '무청시래기 표고버섯 솥밥', 35400, '매콤 닭가슴살 스테이크와 함께', '400', 'plain',null, null);
insert into product values (product_seq.nextval, '고구마치즈롤 스테이크', 38300, '고소한 치즈가 쏙쏙!', '100', 'salty', null, null);
insert into product values (product_seq.nextval, '현미 잡곡밥 & 리얼 카레큐브', 39200, '은은하게 매콤한 카레와 함께', '470', 'exotic',null, null);
insert into product values (product_seq.nextval, '매콤야채 빅볼 닭가슴살', 34800, '프랑스산 웰빙 야채 듬뿍', '120', 'spicy',null, null);
insert into product values (product_seq.nextval, '베지 송송 리얼포테이토 샐러드', 22200, '국내산 감자와 다양한 채소가 송송', '310', 'fresh',null, null);

commit;

insert into member (ID,PW,NAME,PHONE,EMAIL,BIRTH,POST,ROAD,REG_DATE,ROLE) values ('kimya','1111','이푸딧','010-1111-1111','foodit1@home.com','19951212', '12345','서울시 마포구 신촌로 12',sysdate,'member');   

insert into member (ID,PW,NAME,PHONE,EMAIL,BIRTH,POST,ROAD,REG_DATE,ROLE) values ('parkway','1111','이푸린','010-1111-1111','foodit2@home.com','19951217', '12342','서울시 마포구 신촌로 14',sysdate,'member');   

commit;