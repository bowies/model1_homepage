CREATE TABLE mymember ( 
	id			varchar(30) 	not null,
	password	varchar(30) 	not null,
	membername	varchar(30)		not null,
	phone		varchar(15)		not null,
	email		varchar(50) 	not null unique,
	zipcode		varchar(10)		null,
	address1	varchar(200)	null,
	address2	varchar(100)	null,
	job			varchar(20)		null,
	joindate	date			not null,
	picturename	varchar(100)	default 'default.gif',
	membergrade	char(2)			default 'S', --S->M->L
	constraint pk_mymember primary key (id)
);

select * from mymember;
SELECT membername from mymember;
SELECT password from mymember where id = 'blond'


CREATE TABLE mylist ( 
  	listnum		NUMBER(10)    	NOT NULL, 
  	membername  VARCHAR(30)   	NOT NULL, 
  	title   	VARCHAR(100)  	NOT NULL,  
  	content		VARCHAR(4000)	NOT NULL,
  	password	VARCHAR(30)  	NOT NULL,   
  	viewcount	NUMBER(10)    	DEFAULT 0, 
  	listdate   	DATE         	NOT NULL,  
  	grpno   NUMBER(7)    		DEFAULT 0,  
  	indent  NUMBER(2)     		DEFAULT 0, 
  	ansnum  NUMBER(5)    	 	DEFAULT 0,  
  	constraint pk_mylist primary key(listnum)
);

CREATE TABLE myimage ( 
	imagenum	number(10)		not null,
	membername	varchar(30)		not null,
	title		varchar(100)	not null,
	content		varchar(4000)	not null,
	password	varchar(15)		not null,
	grpno		number(7)		default 0,
	indent		number(2)		default 0,
	ansnum		number(5)		default 0,
	id			varchar(30)		default 'no id',
	filename	varchar(100)	not null,
	constraint pk_myimage primary key(imagenum)
);

CREATE TABLE mymemo(       
	memonum		number(10)		not null,
	title		varchar(100)	not null,
	content 	varchar(4000)	not null,
	memodate	date			not null,
	viewcount	number(10)		default 0,
	id			varchar(30)		default 'no id',
	constraint pk_mymemo primary key(memonum)
);
 
CREATE SEQUENCE mymemo_seq 
START WITH 1 
INCREMENT BY 1 
MINVALUE 0 
CACHE 100; 


CREATE TABLE myguest(       
	guestnum		number(10)		not null,
	title		varchar(100)	not null,
	content 	varchar(4000)	not null,
	guestdate	date			not null,
	viewcount	number(10)		default 0,
	id			varchar(30)		default 'no id',
	constraint pk_myguest primary key(guestnum)
);

CREATE SEQUENCE myguest_seq 
START WITH 1 
INCREMENT BY 1 
MINVALUE 0 
CACHE 100; 

CREATE TABLE mybbs(
	bbsnum 		number(10)		not null,
	membername	varchar(30)		not null,
	title		varchar(100)	not null,
	content		varchar(4000)	not null,
	password	varchar(15)		not null,	
  	viewcount	NUMBER(10)    	DEFAULT 0, 
  	listdate   	DATE         	NOT NULL,  
	grpno		number(7)		default 0,
	indent		number(2)		default 0,
	ansnum		number(5)		default 0,
	constraint pk_mybbs primary key(bbsnum)

);

create table myreply(
rnum number not null,
content varchar(500) not null,
regdate date not null,
id varchar(10) not null,
bbsnum number(7) not null,
primary key(rnum),
foreign key(bbsnum)  references mybbs(bbsnum)
 
)



drop table mycalendar

select * from mycalendar

CREATE TABLE mycalendar(
  calendardate  VARCHAR(100)	NOT NULL, 
  title       	VARCHAR(100)  	NOT NULL, -- 제목(*)
  content     	VARCHAR(4000)	NOT NULL, -- 글 내용
  label 		VARCHAR(100)	NOT NULL,
  PRIMARY KEY(calendardate)
);

select * from mycalendar
select * from mycalendarindex

create table mycalendarindex(
	calendarnum number not null,
	calendardate varchar(100) not null,
	primary key(calendarnum)
);

drop table mycalendarindex


CREATE SEQUENCE mycalendarindex_seq 
START WITH 1 
INCREMENT BY 1 
MINVALUE 0 
CACHE 365; 

drop SEQUENCE mycalendarindex_seq 


select calendarnum, calendardate, r
	from(
	select calendarnum, calendardate, rownum as r
	from(
		select calendarnum, calendardate
		from MYCALENDARINDEX
	)
)
order by r


		
		