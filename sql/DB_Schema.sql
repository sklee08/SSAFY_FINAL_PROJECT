CREATE TABLE `housedeal` (
  `no` int NOT NULL AUTO_INCREMENT,
  `dong` varchar(30) NOT NULL,
  `AptName` varchar(50) NOT NULL,
  `code` varchar(30) NOT NULL,
  `dealAmount` varchar(50) NOT NULL,
  `buildYear` varchar(30) DEFAULT NULL,
  `dealYear` varchar(30) DEFAULT NULL,
  `dealMonth` varchar(30) DEFAULT NULL,
  `dealDay` varchar(30) DEFAULT NULL,
  `area` varchar(30) DEFAULT NULL,
  `floor` varchar(30) DEFAULT NULL,
  `jibun` varchar(30) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `rentMoney` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`no`)
);

CREATE TABLE `houseinfo` (
  `no` int DEFAULT NULL,
  `dong` text,
  `AptName` text,
  `code` int DEFAULT NULL,
  `buildYear` int DEFAULT NULL,
  `jibun` text,
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `img` text
);

create table user_info (
	id varchar(20) primary key,
    pw varchar(20) NOT NULL,
    name varchar(10) NOT NULL,
    address varchar(100) NOT NULL,
    sido varchar(30) NOT NULL,
	gugun varchar(30) NOT NULL,
    dong varchar(30) NOT NULL,
    phone varchar(20) NOT NULL
);

create table qna_board (
	qna_no   INT auto_increment comment '질문번호',
	qna_title VARCHAR(300) not null comment '질문제목',
	qna_content VARCHAR(4000) not null comment '질문내용',
	qna_userid VARCHAR(20) not null comment '질문자아이디',
	qna_datetime timestamp DEFAULT CURRENT_TIMESTAMP comment '질문일시',
	reply_content VARCHAR(4000)  comment '답변내용',
	reply_datetime timestamp DEFAULT CURRENT_TIMESTAMP comment '답변일시',   
	reply_userid VARCHAR(20) comment '답변자아이디',
	PRIMARY KEY (`qna_no`),
	CONSTRAINT `qna_to_user_fk1` FOREIGN KEY (`qna_userid`) REFERENCES `user_info` (`id`),
	CONSTRAINT `qna_to_user_fk2` FOREIGN KEY (`reply_userid`) REFERENCES `user_info` (`id`)
) comment = '질문게시판';

create table ranking(
	keyword varchar(30) NOT NULL,
	attribute varchar(30) NOT NULL,
	cnt INT,
	PRIMARY KEY (`keyword`)
);

CREATE TABLE emission (
	no int NOT NULL AUTO_INCREMENT,
	name varchar(30) NOT NULL,
	bizcode varchar(30),
	address varchar(50),
	dongcode varchar(30),
	dong varchar(30),
	PRIMARY KEY (`no`)
);

CREATE TABLE greenzone (
	no int NOT NULL AUTO_INCREMENT,
	name varchar(30) NOT NULL,
	address varchar(50),
	dongcode varchar(30),
	dong varchar(30),
	lng varchar(30) NOT NULL,
	lat varchar(30) NOT NULL,
	bizcode varchar(30),
	PRIMARY KEY (`no`)
);

CREATE TABLE `guguncode` (
  `gugun_code` varchar(10) NOT NULL,
  `gugun_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`gugun_code`)
);

CREATE TABLE `sidocode` (
  `sido_code` varchar(10) NOT NULL,
  `sido_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`sido_code`)
);