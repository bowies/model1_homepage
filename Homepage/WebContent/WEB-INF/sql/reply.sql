drop table reply

create table myreply(
rnum number not null,
content varchar(500) not null,
regdate date not null,
id varchar(10) not null,
bbsnum number(7) not null,
primary key(rnum),
foreign key(bbsnum)  references mybbs(bbsnum)
 
)
 
--create(댓글등록)
select * from MEMBER;
select * from bbs;
 
select nvl(max(rnum),0)+1 from reply;
 
insert into reply(rnum, content, regdate, id, bbsnum)
values((select nvl(max(rnum),0)+1 from reply),
'의견입니다.',sysdate,'user1',1
)
 
 
--read(댓글 내용)
select * from reply
 
--update(댓글 수정)
update reply
set content = '새로운 의견을 올립니다.'
where rnum = 1
 
--delete(댓글 삭제)
delete from REPLY
where rnum = 1
 
 
--list(목록)
select rnum, content, to_char(regdate,'yyyy-mm-dd') regdate, id, bbsnum, r
FROM(
select rnum, content, regdate, id, bbsnum, rownum r
FROM(
select rnum, content, regdate, id, bbsnum
from REPLY
order by rnum DESC
    )
)WHERE r >= 1 and r <= 5
 
 
--total(목록)
select count(*) from reply
 