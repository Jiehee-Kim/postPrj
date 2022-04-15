CREATE TABLE userDb(
userId varchar2(20) primary key,
userPw varchar2(50)
);

CREATE TABLE postDb(
userId varchar2(20),
postNum number primary key,
tag number,
title varchar2(250),
content varchar2(1000)
);

insert into postDb values('admin',1,1,'test1','test1');

CREATE TABLE comments(
userId varchar2(20),
comments varchar2(500),
postNum number,
commentsNum number
);