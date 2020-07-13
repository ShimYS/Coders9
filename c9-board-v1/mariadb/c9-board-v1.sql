/*데이터베이스 생성*/
CREATE DATABASE Coder9;
/*테이블 생성*/
CREATE TABLE USERS (
	user_no INT PRIMARY KEY AUTO_INCREMENT,
	user_id VARCHAR(20) UNIQUE NOT NULL,
	user_password VARCHAR(20) NOT NULL,
	user_name VARCHAR(20),
	user_email VARCHAR(50),
	user_tel VARCHAR(50),
	user_gender ENUM('male','female'),
	user_address VARCHAR(200),
	user_point INT DEFAULT '0',
	user_registdate datetime DEFAULT SYSDATE()
);
CREATE TABLE BOARD (
	board_no INT PRIMARY KEY AUTO_INCREMENT,
	board_title VARCHAR(200) NOT NULL,
	board_content VARCHAR(5000) NOT NULL,
	board_writer VARCHAR(20) NOT NULL,
	board_view_count INT DEFAULT '0',
	board_likes INT DEFAULT '0',
	board_visible BOOLEAN DEFAULT TRUE,
	board_registdate DATETIME DEFAULT SYSDATE()
);
/*포레인키설정*/
ALTER TABLE board
ADD FOREIGN KEY (board_writer) REFERENCES users(user_id);
/*조회명령어*/
select * 
from users;
select * 
from board;
select *
from users a, board b
where a.user_id = b.board_writer;
/*디폴틀값 추가*/
ALTER TABLE users
MODIFY COLUMN user_point int DEFAULT '0';
/*테이블삭제*/
DROP TABLE board;
/*유저 기본정보 추가*/
INSERT INTO users (user_id, user_password)
VALUES ('park', 'zxcv1234');
/*게시판 기본정보 추가*/
INSERT INTO board (board_title, board_content, board_writer)
VALUES ('Hi', 'hi bro', 'shim');

SELECT user_no, user_id, user_password, user_name, user_email, user_tel, user_gender, user_address, user_point, user_registdate 
FROM coder9.users
WHERE user_id = '';

UPDATE coder9.users
SET
	user_name = 'hongdangmu',
	user_email = 'hong@naver.com',
	user_tel = '010-1234-5678',
	user_gender = 'female',
	user_address = 'seoul seongbuk'
WHERE
	user_id = 'myhong';

/*
	언어설정 
Error code: 1366
SQL state: 22001
*/
ALTER TABLE users convert to charset utf8;

/*게시판*/
SELECT board_no, board_title, board_content, board_writer, board_view_count, board_likes, board_visible, board_registdate
FROM coder9.board;

SELECT board_no, board_title, board_content, board_writer, board_view_count, board_likes, board_visible, board_registdate
FROM coder9.board
WHERE board_no = 1;

SELECT board_no, board_title, board_content, board_writer, board_view_count, board_likes, board_visible, board_registdate
FROM coder9.board
WHERE board_writer = 'shim';

UPDATE coder9.board
SET
	board_title = 'Hi',
	board_content = 'hi bro',
	board_view_count = 1,
	board_likes = 1,
	board_visible = FALSE
WHERE
	board_no = 1;