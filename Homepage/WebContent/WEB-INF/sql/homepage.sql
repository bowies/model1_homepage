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
)

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
)

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
)

CREATE TABLE mymemo( 
	memonum		number(10)		not null,
	title		varchar(100)	not null,
	content 	varchar(4000)	not null,
	memodate	date			not null,
	viewcount	number(10)		default 0,
	id			varchar(30)		default 'no id',
	constraint pk_mymemo primary key(memonum)
)
