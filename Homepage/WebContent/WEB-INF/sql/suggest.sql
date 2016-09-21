 CREATE TABLE suggest(
        suggestno NUMBER(7)    NOT NULL,
        sqlpart   VARCHAR(20)  NOT NULL,
        sqlquery  VARCHAR(100) NOT NULL, 
        etc       VARCHAR(100)     NULL,
        PRIMARY KEY(suggestno)
    );
 
 
    DROP SEQUENCE suggest_seq;
 
    CREATE SEQUENCE suggest_seq
    START WITH   10        --시작번호, 0~9는 테스트 일련 번호
    INCREMENT BY 1         --증가값
    MAXVALUE     9999999   --최대값
    CACHE        2         --시쿼스 변경시 자주 update되는 것을 방지하기위한 캐시값
    NOCYCLE;    
    
 
    
    INSERT INTO suggest(suggestno, sqlpart, sqlquery, etc)
    VALUES(suggest_seq.nextval, 'INSERT',
           'INSERT 테이블명 VALUES( ~ )', '');
    INSERT INTO suggest(suggestno, sqlpart, sqlquery, etc)
    VALUES(suggest_seq.nextval, 'INSERT',
           'INSERT 테이블명 ( ~ ) VALUES( ~ )', '');
    INSERT INTO suggest(suggestno, sqlpart, sqlquery, etc)
    VALUES(suggest_seq.nextval, 'SELECT',
           'SELECT * FROM ~', '');    
    INSERT INTO suggest(suggestno, sqlpart, sqlquery, etc)
    VALUES(suggest_seq.nextval, 'SELECT',
           'SELECT * FROM ~ WHERE ~', '');    
    INSERT INTO suggest(suggestno, sqlpart, sqlquery, etc)
    VALUES(suggest_seq.nextval, 'UPDATE',
           'UPDATE ~ SET ~', '');    
    INSERT INTO suggest(suggestno, sqlpart, sqlquery, etc)
    VALUES(suggest_seq.nextval, 'UPDATE',
           'UPDATE ~ SET ~ WHERE ~', '');    
    INSERT INTO suggest(suggestno, sqlpart, sqlquery, etc)
    VALUES(suggest_seq.nextval, 'DELETE',
           'DELETE FROM ~', ''); 
    INSERT INTO suggest(suggestno, sqlpart, sqlquery, etc)
    VALUES(suggest_seq.nextval, 'DELETE',
           'DELETE FROM ~ WHERE ~', ''); 
    INSERT INTO suggest(suggestno, sqlpart, sqlquery, etc)
    VALUES(suggest_seq.nextval, '자바코드',
           '자바001', ''); 
    INSERT INTO suggest(suggestno, sqlpart, sqlquery, etc)
    VALUES(suggest_seq.nextval, '자바코드',
           '자바002', '');                       
    INSERT INTO suggest(suggestno, sqlpart, sqlquery, etc)
    VALUES(suggest_seq.nextval, '자바코드',
           '자바003', '');                       
 
    INSERT INTO suggest(suggestno, sqlpart, sqlquery, etc)
    VALUES(suggest_seq.nextval, '모니터',
           'LCD 15inch', '');      
    INSERT INTO suggest(suggestno, sqlpart, sqlquery, etc)
    VALUES(suggest_seq.nextval, '모니터',
           'LCD 16inch', '');      
    INSERT INTO suggest(suggestno, sqlpart, sqlquery, etc)
    VALUES(suggest_seq.nextval, '모니터',
           'LCD 17inch', '');      
    INSERT INTO suggest(suggestno, sqlpart, sqlquery, etc)
    VALUES(suggest_seq.nextval, '모니터',
           'LCD 18inch', '');      
    INSERT INTO suggest(suggestno, sqlpart, sqlquery, etc)
    VALUES(suggest_seq.nextval, '모니터',
           'LCD 19inch', '');      
    INSERT INTO suggest(suggestno, sqlpart, sqlquery, etc)
    VALUES(suggest_seq.nextval, '모니터',
           'LCD 20inch', '');      
    INSERT INTO suggest(suggestno, sqlpart, sqlquery, etc)
    VALUES(suggest_seq.nextval, '모니터',
           'LCD 21inch', '');      
    INSERT INTO suggest(suggestno, sqlpart, sqlquery, etc)
    VALUES(suggest_seq.nextval, '모니터',
           'LCD 22inch', '');      
    INSERT INTO suggest(suggestno, sqlpart, sqlquery, etc)
    VALUES(suggest_seq.nextval, '모니터',
           'LCD 23inch', '');      
    INSERT INTO suggest(suggestno, sqlpart, sqlquery, etc)
    VALUES(suggest_seq.nextval, '모니터',
           'LCD 24inch', '');      
    INSERT INTO suggest(suggestno, sqlpart, sqlquery, etc)
    VALUES(suggest_seq.nextval, '모니터',
           'LCD 25inch', '');      
    
    
    SELECT * FROM suggest;           
    
    
    COMMIT;
 
 
    SELECT COUNT(sqlquery) as cnt
    FROM suggest 
    WHERE sqlquery LIKE 'INS%'
    ORDER BY sqlquery;
 
    SELECT COUNT(sqlquery) as cnt
    FROM suggest 
    WHERE sqlquery LIKE '자%'
    ORDER BY sqlquery;
    
    
    SELECT sqlquery 
    FROM suggest 
    WHERE sqlquery LIKE 'INS%'
    ORDER BY sqlquery;
 
 
    SELECT sqlquery 
    FROM suggest 
    WHERE sqlquery LIKE '자%'
    ORDER BY sqlquery;
 
 
 